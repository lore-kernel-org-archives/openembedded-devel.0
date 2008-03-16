Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@haerwu.biz>) id 1Janme-0008BW-7s
	for openembedded-devel@openembedded.org; Sun, 16 Mar 2008 08:59:58 +0100
Received: (qmail 9636 invoked by uid 813007); 16 Mar 2008 07:57:29 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 16 Mar 2008 07:57:29 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Mar 2008 08:57:13 +0100
User-Agent: KMail/1.9.9
References: <19c1b8a90803132350x14a3496en8e921fae09cf9aff@mail.gmail.com>
	<47DA38DF.6020307@adtelecom.es>
	<19c1b8a90803151021g7d0eb612j1f37ce818c50ac47@mail.gmail.com>
In-Reply-To: <19c1b8a90803151021g7d0eb612j1f37ce818c50ac47@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200803160857.14602.openembedded@haerwu.biz>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: openembedded@haerwu.biz
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gnome-vfs-2.20.0 needs glib-2.0-2.14.x
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 16 Mar 2008 07:59:58 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia Saturday 15 of March 2008, Khem Raj napisa=B3:
> Joaquim,
>
> I tried with 2.16.1 and it does not help either I end up in the same
> message compiling gnome-vfs 2.20.0. I think we should stick to 2.14.x
> if we are using gnome-2.20
>
> With newer version of gnome it might be ok.

Poky has same problem after glib 2.16.1 upgrade. Upgrading gnome-vfs to=20
2.22.0 resolved problem.

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

                        If it works, don't fix it.
                        		-- Sam Rayburn




