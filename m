Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <openembedded@haerwu.biz>) id 1IW7RD-0001po-D4
	for openembedded-devel@openembedded.org; Fri, 14 Sep 2007 11:26:11 +0200
Received: (qmail 10768 invoked by uid 813007); 14 Sep 2007 09:22:50 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 14 Sep 2007 09:22:50 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Sep 2007 11:22:30 +0200
User-Agent: KMail/1.9.7
References: <200709111318.52432.openembedded@haerwu.biz>
	<46E78180.1050907@student.utwente.nl>
	<46EA3685.2040809@student.utwente.nl>
In-Reply-To: <46EA3685.2040809@student.utwente.nl>
MIME-Version: 1.0
Message-Id: <200709141122.31734.openembedded@haerwu.biz>
Subject: Re: Splitting up bluez in a sane way, was Re: Task-base is big :(
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
X-List-Received-Date: Fri, 14 Sep 2007 09:26:11 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia pi=B1tek, 14 wrze=B6nia 2007, Koen Kooi napisa=B3:

> What can be done is to make the default bluez-utils build only build
> bluez-utils* and have seperate recipes for all the 3rdparty stuff it
> builds:

> That would solve both buildtime and runtime issues.
>
> What do you think?

bluez-utils-cups, bluez-utils-gstreamer, bluez-utils-alsa? Sounds good for=
=20
me - especially first both.

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

          bloody internet
          there was once peace and then the internet came in :-)




