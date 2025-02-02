<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<div class="col-7 col-xxl-6">
	<div class="row g-3">
		<div class="col-12 col-md-6">
			<div class="card h-100" >
				<div class="card-body">
					<canvas id="myChart" width="50" height="30"></canvas>
				</div>
			</div>
		</div>
		<div class="col-12 col-md-6">
			<div class="card h-100" >
				<div class="card-body">
					<canvas id="myChart2" width="30" height="30"></canvas>
				</div>
			</div>
		</div>
		<div class="col-12 col-md-6">
			<div class="card h-100" >
				<div class="card-body">
					<canvas id="myChart3" width="30" height="30"></canvas>
				</div>
			</div>
		</div>
		<div class="col-12 col-md-6">
			<div class="card h-100" >
				<div class="card-body">
					<canvas id="myChart4" width="30" height="30"></canvas>
				</div>
			</div>
		</div>
	<div class="card-body" style="position: relative; top: -800px;right: -800px;">
              <div class="card h-100">
                <div class="card-body">
                  <canvas id="myChart5" width="30" height="30"></canvas>
                </div>
              </div>
            </div>	
	</div>
</div>	
<script>
	const myCt = document.querySelector('#myChart');
	
	  new Chart(myCt, {
	    type: 'bar',
	    data: {
	      labels: [ '1월', '2월', '3월', '4월' ],
	      datasets: [
	        {
	          label: '수입',
	          data: [ 10, 20, 30, 40 ],
			  backgroundColor : '#00C7E2',
	          borderWidth: 1
	        },
	        {
		          label: '수출',
		          data: [ 5, 10, 45, 20 ],
				  backgroundColor : '#FF7DA8',
		          borderWidth: 1
		    }
	      ]
	    },
	    options: {
	      scales: {
	        y: {
	          beginAtZero: true
	        }
	      }
	    }
	  });
	const myCt2 = document.querySelector('#myChart2');
	
	  new Chart(myCt2, {
	    type: 'doughnut',
	    data: {
	      labels: [
	    	  '태국',
	    	  '중국',
	    	  '미국',
	    	  '베트남',
	    	  '싱가포르',
	    	  '일본'
	    	],
	      datasets: [{
	          label: 'My First Dataset',
	          data: [ 500, 300, 50, 100, 50, 200 ],
			  backgroundColor : [
				  '#00C7E2',
				  '#FF7DA8',
				  '#3CB371',
				  '#FFFF00',
				  '#FF4500',
				  '#FF0000'
			],
			hoverOffset:4	  
	        }]
	    }
	  });
	const myCt3 = document.querySelector('#myChart3');
	
	  new Chart(myCt3, {
	    type: 'line',
	    data: {
	      labels: [
	    	  '수입',
	    	  '수출'
	    	],
	      datasets: [{
	          label: 'My First Dataset',
	          data: [ 300, 50 ],
			  backgroundColor : [
				  '#00C7E2',
				  '#FF7DA8'
			],
			hoverOffset:4	  
	        }]
	    }
	  });
	  
</script>
                 
                
                
                
