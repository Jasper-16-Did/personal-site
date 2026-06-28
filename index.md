---
layout: default
title: Home
---
<div class="home-intro">
  <p>Hi, I'm Jaxon. This is my personal corner of the internet — a place for life updates, things I'm thinking about, and whatever else feels worth writing down.</p>
</div>

<ul class="post-list">
  {% for post in site.posts %}
  <li>
    <a class="post-link" href="{{ post.url | relative_url }}">{{ post.title }}</a>
    <div class="post-meta">{{ post.date | date: "%B %-d, %Y" }}</div>
    {% if post.excerpt %}
    <p class="post-excerpt">{{ post.excerpt | strip_html | truncate: 140 }}</p>
    {% endif %}
  </li>
  {% endfor %}
</ul>
