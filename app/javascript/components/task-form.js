import $ from 'jquery';
import 'select2';

const pointsInput = document.getElementById("task_points");
const descriptionInput = document.getElementById("task_description");


const taskForm = () => {

  $('.select2').on('select2:select', function (e) {
    let taskName = event.target.innerText;
    let key = getKeyByValue(object, taskName);
    let points = object[key]['points'];
    let description = object[key]['description'];
    pointsInput.value = points;
    descriptionInput.value = description;

  });

};

export { taskForm };

function getKeyByValue(object, value) { 
  return Object.keys(object).find(key => object[key]['name'] === value);
 } 

const object = {
      poubelles: {
        name: 'Sortir les poubelles',
        description: "Avant qu'elles ne puent !",
        points: 10
      },
      chien: {
        name: "Sortir le chien - 5 points",
        description: "Faire une balade avec chien-chien d'amour",
        points: 5
      },
      litiere: {
        name: "Changer la litière",
        description: "Courage ! Le chachou sera content !",
        points: 10
      },
      lessive: {
        name: "Lancer la lessive",
        description: "Bien trier les couleurs !",
        points: 5
      },
      etendre: {
        name: "Etendre la lessive",
        description: "Bien au soleil",
        points: 10
      },
      aspirateur: {
        name: "Passer l'aspirateur",
        description: "Passer l'aspirateur dans toutes les pièces",
        points: 15
      },
      lit: {
        name: "Faire le lit",
        description: "Ne pas juste ramener la couette pour faire genre...",
        points: 5
      },
      repassage: {
        name: "Faire le repassage",
        description: "Tiens le coup, ça va aller",
        points: 30
      }
    }
