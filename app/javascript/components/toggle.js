export const initToggle = () => {
  const button = document.querySelector("#mark_as_done")
  if (button) {
    button.addEventListener('click', (event)=>{
      button.disabled = true
      fetch(`${window.location.origin}/mark_as_done?task_id=${button.dataset.taskId}&status=${button.dataset.status}`)
      .then(res => res.json())
      .then(data => {
        if(data.message === "success") {
          button.dataset.status = data.status
          button.classList.toggle("class1")
          button.classList.toggle("class2")
        }
        button.disabled = false
      })
    })
  }
}
