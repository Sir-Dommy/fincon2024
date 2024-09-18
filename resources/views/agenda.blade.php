@extends('layouts.business')

@section('title', 'Agenda')

@section('description', 'Financial inclusion and investor exposition 2024 starting thi June')

@section('content')

      <div class="jumbotron jumbotron-fluid bg-white mb-5">
    <div class="container">
      <div class="row">
          <div class="col-md-12">
              <h3>AGENDA</h3>
              <P></P>
          </div>
      </div>
    </div>
  </div>
  
  
  
  <section class="bg-light">
      <div class="container">
          <div class="row">
              <div class="col-lg-12 col-md-12 col-sm-12">
                  <div class="schedules-area pd-top-110 pd-bottom-120">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-xl-7 col-lg-8">
                                <div class="section-title text-center">
                                    <h2>Event Schedules</h2>
                                    <p>Dive into Engaging Sessions: Our agenda is brimming with thought-provoking sessions led by top industry experts. Gain a deeper understanding of financial trends, challenges, and opportunities.</p>
                                </div>
                            </div>
                        </div>
                        
                        <div class="w3-container">
                              <div class="evt-tab-inner text-center nav-tabs">
                                <button class="w3-bar-item btn btn-light btn-lg tablink w3-red" onclick="openCity(event,'day1')"><h3><span>Day 1</span> &nbsp;&nbsp;&nbsp;&nbsp;Wed 25 Sep 2024</h3></button>
                                <button class="w3-bar-item btn btn-light btn-lg tablink" onclick="openCity(event,'day2')"><h3>Day 2</span> &nbsp;&nbsp;&nbsp;&nbsp;Thur 26 Sep 2024</h3></button>
                              </div>
                              
                                <div id="ex1-content">
                                  <div id="day1" class="w3-container w3-border city">
                                    <div class="row">
                                        @php
                                            $day1agenda = App\Models\Agenda::where('session_date', '2024-09-25')->get();
                                        @endphp
                                        
                                        @foreach($day1agenda as $day1)
                                        <div class="col-lg-4 col-md-6">
                                            @if($day1->session_type === 'break-session')
                                            <div class="single-schedules-inner lunch-schedules text-center">
                                                <div class="lunch-schedules-inner align-self-center">
                                                    <div class="icons">
                                                        <img src="{{ url('storage/agendas/'. $day1->cover_img) }}" style="width: 200px; height=200px;" alt="img">
                                                    </div>
                                                    <h5>{{ $day1->title }}</h5>
                                                    <div class="date">
                                                        <i class="fa fa-clock-o"></i>
                                                        {{ $day1->from_time.' - '.$day1->to_time }}
                                                    </div>
                                                </div>
                                            </div>
                                            @else
                                            <div class="single-schedules-inner">
                                                <div class="date">
                                                    <i class="fa fa-clock-o"></i>
                                                    {{ $day1->from_time.' - '.$day1->to_time }}
                                                </div>
                                                <h5>{{ $day1->title }}</h5>
                                                <div>{!! $day1->short_desc !!}</div>
                                                <div class="media">
                                                    <div class="media-left">
                                                        <img src="{{ url('storage/agendas/'. $day1->cover_img) }}" alt="img">
                                                    </div>
                                                    <div class="media-body align-self-center">
                                                        <h6>{{ $day1->venueroom->name }}</h6>
                                                        <!--<p>{{ $day1->contact_person }}</p>-->
                                                    </div>
                                                </div>
                                            </div>
                                            @endif
                                        </div>
                                        @endforeach
                                    </div>
                                  </div>
                                
                                  <div id="day2" class="w3-container w3-border city" style="display:none">
                                    <div class="row">
                                        @php
                                            $day2agenda = App\Models\Agenda::where('session_date', '2024-09-26')->get();
                                        @endphp
                                        
                                        @foreach($day2agenda as $day2)
                                        <div class="col-lg-4 col-md-6">
                                            @if($day2->session_type === 'break-session')
                                            <div class="single-schedules-inner lunch-schedules text-center">
                                                <div class="lunch-schedules-inner align-self-center">
                                                    <div class="icons">
                                                        <img src="{{ url('storage/agendas/'. $day2->cover_img) }}" style="width: 200px; height=200px;" alt="img">
                                                    </div>
                                                    <h5>{{ $day2->title }}</h5>
                                                    <div class="date">
                                                        <i class="fa fa-clock-o"></i>
                                                        {{ $day2->from_time.' - '.$day2->to_time }}
                                                    </div>
                                                </div>
                                            </div>
                                            @else
                                            <div class="single-schedules-inner">
                                                <div class="date">
                                                    <i class="fa fa-clock-o"></i>
                                                    {{ $day2->from_time.' - '.$day2->to_time }}
                                                </div>
                                                <h5>{{ $day2->title }}</h5>
                                                <div>{!! $day2->short_desc !!}</div>
                                                <div class="media">
                                                    <div class="media-left">
                                                        <img src="{{ url('storage/agendas/'. $day2->cover_img) }}" alt="img">
                                                    </div>
                                                    <div class="media-body align-self-center">
                                                        <h6>{{ $day2->venueroom->name }}</h6>
                                                        <!--<p>{{ $day2->contact_person }}</p>-->
                                                    </div>
                                                </div>
                                            </div>
                                            @endif
                                        </div>
                                        @endforeach
                                    </div>
                                  </div>
                                </div>
                            
                            </div>
                    </div>
                </div>

              </div>
          </div>
          
          <br><br><br>
          @include('partials.register')
        @include('partials.partners')
        @include('partials.fincon-experience')
      </div>
  </section>

@endsection

@push('scripts')

<script>
    function openCity(evt, cityName) {
      var i, x, tablinks;
      x = document.getElementsByClassName("city");
      for (i = 0; i < x.length; i++) {
        x[i].style.display = "none";
      }
      tablinks = document.getElementsByClassName("tablink");
      for (i = 0; i < x.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" w3-red", "");
      }
      document.getElementById(cityName).style.display = "block";
      evt.currentTarget.className += " w3-red";
    }
</script>

@endpush

@push('styles')

<style>

.w3-red,.w3-hover-red:hover{color:#fff!important;background-color:#ffd300!important}
    .evt-tab-inner {
  margin-bottom: 80px;
}
.evt-tab-inner ul {
  margin: 0;
  padding: 0;
  border: 0 !important;
}
.evt-tab-inner ul li {
  text-align: center;
  display: contents;
}
.evt-tab-inner ul li a {
  border: 1px solid var(--main-color) !important;
  height: 100px;
  line-height: 100px;
  padding: 0;
  width: 33.33%;
  border-radius: 0 !important;
  font-size: 24px;
  position: relative;
}
.evt-tab-inner ul li a span {
  font-weight: 700;
  margin-right: 25px;
  color: #20202c;
}
.evt-tab-inner ul li a:after {
  content: "";
  position: absolute;
  height: 30px;
  width: 30px;
  background: var(--main-color);
  transform: rotate(45deg);
  left: 50%;
  margin-left: -15px;
  bottom: -16px;
  opacity: 0;
  visibility: hidden;
  transition: all 0.4s ease-in;
}
.evt-tab-inner ul li a:hover, .evt-tab-inner ul li a:active, .evt-tab-inner ul li a:focus, .evt-tab-inner ul li a.active {
  background: var(--main-color) !important;
  color: #fff !important;
}
.evt-tab-inner ul li a:hover span, .evt-tab-inner ul li a:active span, .evt-tab-inner ul li a:focus span, .evt-tab-inner ul li a.active span {
  color: #fff;
}
.evt-tab-inner ul li a:hover:after, .evt-tab-inner ul li a:active:after, .evt-tab-inner ul li a:focus:after, .evt-tab-inner ul li a.active:after {
  opacity: 1;
  visibility: visible;
}
.evt-tab-inner.style-two ul li a {
  width: 50%;
}

.single-schedules-inner {
    background-color:#fff;
  box-shadow: 0px 3px 15px 0px rgba(184, 40, 88, 0.08);
  padding: 30px 30px 35px 30px;
  margin-bottom: 30px;
  transition: 0.4s;
  border-radius: 20px;
}
.single-schedules-inner .date {
  color: var(--main-color);
  font-size: 14px;
  margin-bottom: 15px;
}
.single-schedules-inner .date i {
  color: #646e85;
  margin-right: 3px;
}
.single-schedules-inner h5 {
  line-height: 36px;
  margin-bottom: 18px;
}
.single-schedules-inner .icons {
  margin-bottom: 20px;
}
.single-schedules-inner p {
  margin-bottom: 0;
}
.single-schedules-inner .media {
  margin-top: 43px;
}
.single-schedules-inner .media .media-left {
  margin-right: 15px;
}
.single-schedules-inner .media .media-left img {
  height: 60px;
  width: 60px;
  border-radius: 10px;
}
.single-schedules-inner .media .media-body h6 {
  font-weight: 500;
  margin-bottom: 0;
}
.single-schedules-inner .media .media-body p {
  margin-bottom: 0;
  font-size: 12px;
  font-weight: 500;
}
.single-schedules-inner:hover {
  box-shadow: 0px 6px 30px 0px rgba(184, 40, 88, 0.2);
}
.single-schedules-inner.lunch-schedules {
  height: 93.1%;
  display: flex;
  align-items: center;
  justify-content: center;
}

/*------------- single-schedules-inner 02--------------*/
.single-schedules-inner-two {
  border-bottom: 1px solid #E5E5E5;
  margin-bottom: 30px;
  padding-bottom: 30px;
}
.single-schedules-inner-two .schedules-date {
  display: inline-block;
  background: var(--main-color);
  height: 150px;
  width: 150px;
  padding-top: 35px;
  position: absolute;
}
.single-schedules-inner-two .schedules-date .number {
  font-size: 45px;
  font-weight: 700;
  display: block;
  color: #fff;
  margin-bottom: 0;
  line-height: 1;
}
.single-schedules-inner-two .schedules-date .text {
  font-size: 24px;
  font-weight: 400;
  display: block;
  color: #fff;
}
.single-schedules-inner-two .media {
  padding-left: 170px;
}
.single-schedules-inner-two .media .media-left {
  margin-right: 20px;
}
.single-schedules-inner-two .media .media-body h4 {
  font-size: 28px;
  font-family: var(--heading-font);
  font-weight: 500;
}
.single-schedules-inner-two .schedules-location h4 {
  font-size: 28px;
  font-family: var(--heading-font);
  font-weight: 500;
}

/*------------- single-schedules-inner 03--------------*/
.schedules-date {
  display: inline-block;
  background: var(--main-color);
  height: 150px;
  width: 150px;
  padding-top: 35px;
  position: absolute;
}
.schedules-date .number {
  font-size: 45px;
  font-weight: 700;
  display: block;
  color: #fff;
  margin-bottom: 0;
  line-height: 1;
}
.schedules-date .text {
  font-size: 24px;
  font-weight: 400;
  display: block;
  color: #fff;
}

.event-schedule-3 {
  margin: 0;
  padding: 0;
}
.event-schedule-3 li {
  padding-left: 176px;
  position: relative;
  list-style: none;
}
.event-schedule-3 li:after {
  content: "";
  position: absolute;
  left: 70px;
  top: 140px;
  bottom: 0;
  background: rgba(255, 255, 255, 0.5);
  z-index: -1;
  height: 100%;
  width: 1px;
  z-index: -2;
}
.event-schedule-3 li:last-child:after {
  display: none;
}
.event-schedule-3 .schedules-date {
  left: 0;
  width: 147px;
  height: 140px;
  background: #FD0156;
}
.event-schedule-3 .schedules-date:after {
  content: "";
  position: absolute;
  left: 10px;
  right: 10px;
  top: 10px;
  bottom: -10px;
  background: #5E39E8;
  z-index: -1;
}

.single-event-schedule-3 {
  background: #fff;
  padding: 50px;
  margin-bottom: 50px;
  position: relative;
}
.single-event-schedule-3:after {
  content: "";
  position: absolute;
  left: 20px;
  right: 20px;
  top: 20px;
  bottom: -20px;
  background: #5E39E8;
  z-index: -1;
}
.single-event-schedule-3 .media-left {
  margin-right: 50px;
}
.single-event-schedule-3 .media-left img {
  border-radius: 20px;
  margin-bottom: 10px;
}
.single-event-schedule-3 .media-left h6 {
  margin-bottom: 0;
  color: #eee;
}
.single-event-schedule-3 .media-left p {
  font-size: 12px;
  margin-bottom: 0;
  color: #eee;
}
.single-event-schedule-3 .media-body h4 {
  margin-bottom: 5px;
  color: #eee;
}
.single-event-schedule-3 .media-body p {
  color: #eee;
}
.single-event-schedule-3 .media-body .time {
  margin-bottom: 0;
  color: #eee;
}

.nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active {
    color: #495057;
    background-color: #20B2AA !important;
    border-color: #dee2e6 #dee2e6 #fff;
}
.evt-tab-inner ul li a:hover, .evt-tab-inner ul li a:active, .evt-tab-inner ul li a:focus, .evt-tab-inner ul li a.active {
    background: #eee !important;
    color: #fff !important;
}
.nav-tabs .nav-link {
    border: 1px solid transparent;
    border-top-left-radius: .25rem;
    border-top-right-radius: .25rem;
}
.evt-tab-inner ul li a {
    border: 1px solid var(--main-color) !important;
    height: 100px;
    line-height: 100px;
    padding: 0;
    width: 33.33%;
    border-radius: 0 !important;
    font-size: 24px;
    position: relative;
}
.nav-link {
    display: block;
    padding: .5rem 1rem;
}

</style>

@endpush
