Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1Sjr2Y-00013b-2f
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Jun 2012 14:08:10 +0200
Received: by ghbz2 with SMTP id z2so767321ghb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jun 2012 04:57:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:date
	:message-id:subject:from:to:content-type:x-gm-message-state;
	bh=NbQZTvWPbPoIw1jekyQ9wnzztMdKcdi80rAKfMKEYPQ=;
	b=lfZSr5bqctH7QRt5rlrzmXt+AEJNxAu1XOiOS9ytSdh7Y0SnLGA0qyhej6PwOUn+5o
	DwsQpSzbB2ui09oVGlQOOrm48mKwkDhDgIM0Zx7D3yRA+McIHCgFmeTyvMVAxyQMM2pH
	yBqIPWnvr15QJcN4VOmfbbQiIUHCLq7epwhdj99Obn2+WarEKHvN7wEQ+EjhAWwO5LIH
	WZvyM2JU8tSTWu20jFcxAjJZKIF5f0d2iE/ufWj1nZvsCe8Jf1jnxgQmLRNtmI60z+uS
	olu0Ybb6pm5QAWkcIXyO7tsiDNeHeDQFN1gICZsyVGIf2C8F51AS7TFkEGB+b3Hxk9wX
	XjNw==
MIME-Version: 1.0
Received: by 10.42.244.6 with SMTP id lo6mr10486083icb.8.1340798236102; Wed,
	27 Jun 2012 04:57:16 -0700 (PDT)
Received: by 10.64.10.161 with HTTP; Wed, 27 Jun 2012 04:57:15 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
Received: by 10.64.10.161 with HTTP; Wed, 27 Jun 2012 04:57:15 -0700 (PDT)
In-Reply-To: <4FEAE2BE.9010707@emagii.com>
References: <4FEAE2BE.9010707@emagii.com>
Date: Wed, 27 Jun 2012 14:57:15 +0300
Message-ID: <CAK18fxGez85nNTcOdKW-j-BpTmxo-Duu0T+m1cNMwP+R3u2j5Q@mail.gmail.com>
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQkvCdDLBsfWqecshuk1OSbY7z6MyZ/JGRW9X62M0LvR3GSrtgJ2lZIs3olmIRBOD3M0CU8E
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Missing kernel modules in OE 2011.03
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Jun 2012 12:08:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

What image are you trying to bake?

