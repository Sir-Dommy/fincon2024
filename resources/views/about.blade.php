@extends('layouts.business')

@section('title', 'About AMFI')

@section('description', 'Financial inclusion and investor exposition 2024 starting thi June')

@section('content')

  <section class="showcase bg-light-blue">
    <div class="container-fluid p-0">
      <div class="row no-gutters text-white text-center">
        <div class="col-md-8 offset-md-2 order-lg-1 my-auto showcase-text">
          <h2>Association for Microfinance Institutions (AMFI)</h2>
          <p class="lead">The Association for Microfinance Institutions (AMFI) is a member-based organization that was established and registered in 1999 under the Societies Act, with the aim of building the capacity of the Kenyan Microfinance Industry. In her 24 years of existence, AMFI`s membership has increased from the original 5 founder members to the current 63 fully paid-up members in 2023. Adoption of the Alternative banking channels (ABC) has made the provision of financial services easier, more affordable, and time-saving. This has promoted the accessibility of services, especially for low-income people in rural and marginalized areas. Vision 2030 identified the microfinance sub-sector as key in ensuring every Kenyan is bankable by 2030. This has seen the government intensify the financial inclusion campaign by creating funds for the microfinance sector in the National budget, establishing funds for women and youth, and also developing legislation to promote micro and small enterprises (MSMEs). The Association of Microfinance Institutions-Kenya has made good progress and ambitious strategic decisions and policies since its inception 24 years ago.</p>
            <a href="https://amfikenya.com/" target="_blank" class="btn btn-yellow rounded-pill">Visit Website</a>
        </div>
      </div>
      
      <br><br><br>
      @include('partials.register')
      @include('partials.partners')
        @include('partials.fincon-experience')
    </div>
  </section>

@endsection
