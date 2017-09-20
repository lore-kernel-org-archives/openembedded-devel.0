Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id A1F6977F34;
	Wed, 20 Sep 2017 20:08:46 +0000 (UTC)
Received: by mail-pf0-f169.google.com with SMTP id l188so2062483pfc.6;
	Wed, 20 Sep 2017 13:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1gVkF4Dwl+e4yM5Z/6kcPJ4RazwYLr/jC0tepEb+Ms8=;
	b=e2U+i1XM6BJVloOwdUl2Q99Dzb+NrM/EuzHcqf+xi6k4l1dNYutZj35p6inEbZfm3r
	bZNme1sZ033bgNZrgaeZ9Zv0eNStQ+m7Tme5oyB6clbGNSN2tm6yqkeGYY1JKMpmt1ux
	+b6hGuFPQYVQ9dciHYi8M25wp2ETxjshdAplP/ZMV3iBrYGVaSZFnnD83QkWion0yjMF
	2Wi1V9c6mvXrvNTs41yeq1NsaGthp50+25dgN9LQ/2CAD45WgKvZVIUNy0N8HUvVjFjh
	lMiuH/M++ny0r5Sj2DWhtNHp+W5bK7o1TLzCoGrtulY/OyryZ7caBn31aZ51pIbpAvqT
	AyNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1gVkF4Dwl+e4yM5Z/6kcPJ4RazwYLr/jC0tepEb+Ms8=;
	b=C19apjtycKX0G6H/YHme+wEwcZsMp9yWlCXncbu/7CCV8QI/YnDm/b/qw06Wlp9GY0
	HitpUsG+Huua3aNPho6tl/CjAbcjoaGfix4NEKIYda3CdWOd6h9OtvE7vLzDbQvU6bEx
	/ZONBJfyU98qHq8CeGFIePidjIF8HaHrMQYcDphWdYciLmfuNpxVNs9OWVoEMP7X54XR
	eOgbUMpzz8u4DqPAzH+RCZtPKjA8+XFuwi7iMh6vHGVQWtsBYVvdRi88wYPYmAbMRqbQ
	/M92506RJrDoOyn0UNyRBEOZseXm30VPaxpRmhmIlQs/Z4yQIsfV9ppJnWknDd4TwCZf
	j6ng==
X-Gm-Message-State: AHPjjUghK6+QVqxejqry3euXX5XKkeZX0wY029mYRBI2ZlhmsdHbBlPA
	sUwYAyK3D9X+JaqihrqEMD3S2PfswH2mozE1DhA=
X-Google-Smtp-Source: AOwi7QBPsTs618pW8dZ3DEd7OTQmsEsEPZf7OoqQg0RLrKdq5lRWLxVkP2rLwthRRgRqsLzSwk2OLBu/PzSPhJ+h+y8=
X-Received: by 10.101.86.196 with SMTP id w4mr1468298pgs.341.1505938127908;
	Wed, 20 Sep 2017 13:08:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.149.73 with HTTP; Wed, 20 Sep 2017 13:08:17 -0700 (PDT)
In-Reply-To: <CA+YB3rZv+=nB=7J98XGqemV5GHW3QkmA7siyn-vArqfK8GHKmA@mail.gmail.com>
References: <c2ec1aa7-8279-78f1-6523-c345af1ffe8f@mentor.com>
	<CAHUNapQDGe3b4Nmg6OmL0hxkMGyY9e3z=GKdkOW8VuJe9-q2Ew@mail.gmail.com>
	<CAMKF1spb4tz=te84G=JA40HxiF+wX=YSJnJcK8viyx_OwZ87uw@mail.gmail.com>
	<CA+YB3rZv+=nB=7J98XGqemV5GHW3QkmA7siyn-vArqfK8GHKmA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Sep 2017 13:08:17 -0700
Message-ID: <CAMKF1so3xnW4Gfy1e-sW1Xa6SLckH=e=v3rcYh90jm02=rgN-A@mail.gmail.com>
To: Jeff Osier-Mixon <jefro@jefro.net>
Cc: "openembedded-members@lists.openembedded.org"
	<openembedded-members@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: OE general meeting before OEDEM next month.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Sep 2017 20:08:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 20, 2017 at 11:24 AM, Jeff Osier-Mixon <jefro@jefro.net> wrote:
> Zoom might be easier, as people can dial in or connect online. We'll make it
> work.

cool thanks.

