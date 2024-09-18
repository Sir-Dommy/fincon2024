<nav class="navbar navbar-expand-md navbar-light shadow-sm bg-royal-blue">
    <div class="container">
        <a class="navbar-brand" href="{{ url('/') }}">
            <img src="{{ asset('img/fincon-logo.png') }}" style="height: 90px;">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="{{ __('Toggle navigation') }}">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            

            {{-- <!-- Right Side Of Navbar -->
            <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a href="{{ url('about-amfi') }}" class="nav-link text-white">About AMFI</a>
                    </li>
                    <li class="nav-item">
                        <a href="{{ url('venue') }}" class="nav-link text-white">Venue</a>
                    </li>
                    <li class="nav-item">
                        <a href="{{ url('agenda') }}" class="nav-link text-white">Agenda</a>
                    </li>
                    <li class="nav-item">
                        <a href="{{ url('partners') }}" class="nav-link text-white">Partners</a>
                    </li>
                
                @guest
                    <li class="nav-item">
                        <a class="nav-link btn btn-yellow rounded-pill" href="{{ route('register') }}">Take Part</a>
                    </li>
                @else
                    <li class="nav-item">
                        <a class="nav-link text-white" href="{{ url('/home') }}">Home</a>
                    </li>
                    <!--<li class="nav-item">
                        <a class="nav-link" href="#">Tickets</a>
                    </li>-->
                    <li class="nav-item dropdown ">
                        <a id="navbarDropdown" class="nav-link dropdown-toggle text-white" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
                            {{ Auth::user()->name }} <span class="caret"></span>
                        </a>

                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                            <!--<a class="dropdown-item" href="{{ route('events.index') }}">
                                Manage My Events
                            </a>-->
                            <a class="dropdown-item" href="{{ route('user.profile.view') }}">
                                My Profile
                            </a>
                            <a class="dropdown-item" href="{{ route('logout') }}"
                               onclick="event.preventDefault();
                                             document.getElementById('logout-form').submit();">
                                {{ __('Logout') }}
                            </a>

                            <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                @csrf
                            </form>
                        </div>
                    </li>
                @endguest
            </ul>--}}
        </div>
    </div>
</nav>