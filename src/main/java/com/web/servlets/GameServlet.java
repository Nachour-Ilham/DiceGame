package com.web.servlets;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.bo.GameState;
import com.bo.Message;
import com.bo.User;
import com.bo.Dice;
import com.web.helpers.GameContextManagement;


@WebServlet("/back/GameServlet")
public class GameServlet extends HttpServlet {
	protected void play(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// On récupére la session de l'utilisateur en cours
		HttpSession session = request.getSession();

		// On récupére de la session, les informations du joueur en cours
		User user = (User) session.getAttribute("user");

		// Pour gérer les données de l'application dans le ServletContext
		GameContextManagement gameContext = GameContextManagement.getInstance(getServletContext());

		// Cette objet est déjà inséré dans la session au moment de login
		GameState gameSate = (GameState) session.getAttribute("gameState");


		ArrayList<Dice> dices= (ArrayList<Dice>) session.getAttribute("dices");
		List<Message> msg = new ArrayList<>();


		// On récupère le numéro de dé choisi par l'utilisateur
		int diceNumber = Integer.parseInt(request.getParameter("diceNumber"));

		Random rd=new Random();
		int diceResult=rd.nextInt(6)+1;
		Dice dice = new Dice(diceNumber,diceResult);

		if(dices==null){
			dices = new ArrayList<>();
			session.setAttribute("dices", dices);
		}

		if(dices.isEmpty()){
			dices.add(dice);
			gameSate.IncrementCompteur();
			msg.add(new Message("Dice"+diceNumber + diceResult, Message.INFO));
			request.setAttribute("messages",msg);
			getServletContext().getRequestDispatcher("/WEB-INF/vues/back/userHome.jsp").forward(request, response);
		}else {
			boolean exists = false;
			for (Dice d : dices) {
				if (d.getDiceNumber() == diceNumber) {
					exists = true;
					break;
				}
			}
			if (exists) {
				user.setScore(-1);
				user.setBestScore(user.getScore());
				getServletContext().getRequestDispatcher("/WEB-INF/vues/back/resultat.jsp").forward(request, response);
				return;

			} else {
				dices.add(dice);
				msg.add(new Message("Dice " + diceNumber + diceResult, Message.INFO));
				request.setAttribute("messages", msg);
				gameSate.IncrementCompteur();
			}


			boolean Shouldstop = false;

			if(dices.size()==2){

				if ( dices.get(1).getDiceNumber() == dices.get(0).getDiceNumber()) {
					Shouldstop = true;
				}
				if (dices.get(1).getDiceNumber() == 2 && ( dices.get(1).getDiceNumber() == 1 ||  dices.get(1).getDiceNumber() == 6)) {
					Shouldstop = true;

				}
				if(Shouldstop) {
					user.setBestScore(user.getScore());
					gameSate.reinit();
					getServletContext().getRequestDispatcher("/WEB-INF/vues/back/resultat.jsp").forward(request, response);
					return;
				}else{
					getServletContext().getRequestDispatcher("/WEB-INF/vues/back/userHome.jsp").forward(request,response);
				    return;
				}


			}else if (dices.size()==3){
				//Les dés sont classés par ordre croissant de leurs valeurs.
				if (dices.get(0).getDiceResult() < dices.get(1).getDiceResult() && dices.get(1).getDiceResult() < dices.get(2).getDiceResult()) {
					user.setScore(dices.get(0).getDiceResult() + dices.get(1).getDiceResult() + dices.get(2).getDiceResult());
					user.setBestScore(user.getScore());
					gameSate.reinit();

                //Les dés sont classés par ordre décroissant de leurs valeurs.
				} else if (dices.get(0).getDiceResult() > dices.get(1).getDiceResult() && dices.get(1).getDiceResult() > dices.get(2).getDiceResult()) {
					user.setScore(dices.get(0).getDiceResult() * dices.get(1).getDiceResult() * dices.get(2).getDiceResult());
					user.setBestScore(user.getScore());
					gameSate.reinit();

                // Les valeurs des dés ne suivent ni l'ordre croissant ni l'ordre décroissant.
				} else {
					user.setScore(0);
					user.setBestScore(user.getScore());
					gameSate.reinit();
				}

				if (dices.size() <= 2) {
					getServletContext().getRequestDispatcher("/WEB-INF/vues/back/userHome.jsp").forward(request, response);
					return;
				} else if (dices.size() == 3) {
					getServletContext().getRequestDispatcher("/WEB-INF/vues/back/resultat.jsp").forward(request, response);
					return;
				}
			}

		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		play(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		play(request, response);

	}

}
