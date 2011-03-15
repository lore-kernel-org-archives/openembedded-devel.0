Received: from vms173003pub.verizon.net ([206.46.173.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded@rkmorris.us>) id 1PzLBY-0006JD-P7
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Mar 2011 04:44:40 +0100
Received: from server ([unknown] [71.164.183.134]) by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LI200G3PVJ70S00@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	14 Mar 2011 21:42:43 -0500 (CDT)
Received: from server (127.0.0.1) by server (Axigen)
	with ESMTPSA id 3DEAA5; Mon, 14 Mar 2011 21:42:39 -0500
Received: from [192.168.1.2] by rkmorris.us with HTTP; Mon,
	14 Mar 2011 21:42:37 -0500
From: Russell Morris <openembedded@rkmorris.us>
Date: Mon, 14 Mar 2011 21:42:37 -0500
X-Mailer: Axigen WebMail
To: openembedded-devel@lists.openembedded.org
Message-id: <1300156957735069500@rkmorris.us>
In-reply-to: <E1Pxmz1-0005jc-DM@happy.bec-systems.com>
References: <E1Pxmz1-0005jc-DM@happy.bec-systems.com>
Importance: Normal
MIME-version: 1.0
X-AxigenVirus-Level: 1
X-AxigenSpam-Level: 5
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: testing branch 2011-03-10
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
X-List-Received-Date: Tue, 15 Mar 2011 03:44:40 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,

=20

I can't post this to the Wiki right now (as it's down) ... so a note that =
the builds for a h1940 machine seem to fail (console-image and x11-gpe-imag=
e, angstrom-2010.x distro). They fail at the do_configure stage of the Linu=
x kernel (but this has built correctly in the past, and I just manually bui=
ld a much more recent kernel and it works, so I think my box is configured =
correctly).

=20

Thanks,

... Russell


On Thu, Mar 10, 2011 03:01  PM, cbrake <cliff.brake@gmail.com> wrote:


>=20
master has been merged to testing-next and is ready for clean builds
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
From raj.khem@gmail.com Tue Mar 15 07:06:41 2011
Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PzNOw-00077a-TN
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Mar 2011 07:06:40 +0100
Received: by fxm19 with SMTP id 19so239400fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Mar 2011 23:04:57 -0700 (PDT)
DKIM-Signature: v
