<section class="bg-white">
    <div class="container py-5">
        <div class="py-2">
            <div class="row">
                <div class="col-lg-10 col-md-10 col-sm-12 mx-auto">
                    <h3 class="mb-4 text-center"><span class="text-orange">THEME:</span> Enhancing financial inclusion-Bridging Economic Opportunities and Outcomes.</h3>
                    
                    
                    <!-- Countdown 1 -->
                    <div class="rounded bg-gradient-1 text-white shadow p-5 text-center mb-5">
                        <h4 class="mb-4 font-weight-bold text-uppercase">WE ARE LIVE IN</h4>
                        <div id="countdown" class="countdown-circles d-flex flex-wrap justify-content-center pt-4"></div>
                    </div>
    
                </div>
            </div>
        </div>
    </div>
</section>

@push('scripts')

<script>
    // Set the date we're counting down to
    var countDownDate = new Date("Sep 25, 2024 08:00:00").getTime();
    
    // Update the count down every 1 second
    var x = setInterval(function() {
    
      // Get today's date and time
      var now = new Date().getTime();
        
      // Find the distance between now and the count down date
      var distance = countDownDate - now;
        
      // Time calculations for days, hours, minutes and seconds
      var days = Math.floor(distance / (1000 * 60 * 60 * 24));
      var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
      var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
      var seconds = Math.floor((distance % (1000 * 60)) / 1000);
        
      // Output the result in an element with id="countdown"
      document.getElementById("countdown").innerHTML = '<div class="holder m-2"><span class="h1 font-weight-bold">' + days + '</span> Days</div> <div class="holder m-2"><span class="h1 font-weight-bold">' + hours + '</span> Hrs</div> <div class="holder m-2"><span class="h1 font-weight-bold">' + minutes + '</span> Min</div> <div class="holder m-2"><span class="h1 font-weight-bold">' + seconds + '</span> Sec</div> ';

      // If the count down is over, write some text 
      if (distance < 0) {
        clearInterval(x);
        document.getElementById("countdown").innerHTML = "EXPIRED";
      }
    }, 1000);
</script>

@endpush

@push('styles')

    <style>
        /*
        *
        * ==================================================
        * UNNECESSARY STYLE - JUST TO MAKE IT LOOKS NICE
        * ==================================================
        *
        */
        .countdown {
            text-transform: uppercase;
            font-weight: bold;
        }
        
        .countdown span {
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
            font-size: 3rem;
            margin-left: 0.8rem;
        }
        
        .countdown span:first-of-type {
            margin-left: 0;
        }
        
        .countdown-circles {
            text-transform: uppercase;
            font-weight: bold;
        }
        
        .countdown-circles span {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.2);
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
        }
        
        .countdown-circles span:first-of-type {
            margin-left: 0;
        }
        
        .bg-gradient-1 {
            background: #4169e1;
            background: -webkit-linear-gradient(to right, #4169e1, #86a8e7, #FFD301);
            background: linear-gradient(to right, #4169e1, #86a8e7, #FFD301);
        }
        
        .rounded {
            border-radius: 1rem !important;
        }
        

    </style>

@endpush