Received: from mrqout3.tiscali.it ([195.130.225.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <l.bolognini@tiscali.it>) id 1PpGhF-000698-1h
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Feb 2011 09:55:45 +0100
Received: from [10.39.115.21] by mrq-3 with esmtp (Exim)
	id 1PpGg7-0006Aq-Bg; Tue, 15 Feb 2011 09:54:35 +0100
Received: from ps-wm4 (10.39.75.204) by mail-1.mail.tiscali.sys (8.5.134)
	id 4D3EB05B0086D9AF; Tue, 15 Feb 2011 09:51:44 +0100
Message-ID: <1802836.185231297759904253.JavaMail.defaultUser@defaultHost>
Date: Tue, 15 Feb 2011 09:51:44 +0100 (CET)
From: Luca Bolognini <l.bolognini@tiscali.it>
To: Arago Mailing List <arago-devel@gforge.ti.com>, 
	Open Embedded Mailing List <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
xOriginalSenderIP: 78.6.111.196
Cc: lamiaposta71@gmail.com
Subject: apache2+php5 on Arago
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
X-List-Received-Date: Tue, 15 Feb 2011 08:55:45 -0000
Content-Type: text/plain;charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yesterday I had an exchange of emails with Raffaele Recalcati, it was=20
in italian then I'll try to resume briefly so that everyone can read.
I=20
was asking Raffaele (by the way, thank you for your prompt reply) if he=20
had some news about the Apache2+php5 segmentation faults that occurred=20
in Arago distros.
I'm currently developing for beagleboard and TI816x-
evm.
Raffaele pointed out that he had investigated for some time the=20
crash in Arago=20
( https://gforge.ti.com/gf/project/arago/mailman/?
_forum_action=3DForumMessageBrowse&thread_id=3D3792&action=3DListThreads&ma=
ilman_id=3D39=20
)
but at length he had chosen to compile the two packages with a "pure"=20
OE environment, without Arago overlay.
With this choice, he said that=20
Apache2 is able to open php pages without problems.
It seems rather=20
strange, as recipes are more or less the same (Raffaele added some=20
customizations but they honestly seem not relevant) and tar.gz source=20
files are identical.
What can Arago have introduced to produces such=20
troubles? It's difficult to say.
It's quite annoying to use Arago for=20
all packages of my custom filesystem and then switch to OE only for=20
apache2 and modphp; all my scripting stuff is concerned with Arago,=20
it's would be great to have everything confined inside Arago layer.

Denys told he would have postponed some further investigations on the=20
topic, maybe now he has some good news?
Now however I'm going to make=20
the same tests of Raffaele, that is have the two packages compiled with=20
"pure" OE; in the meantime, if someone has any ideas...
Thank you,
bye


Luca



Supera i limiti: raddoppia la velocit=C3=A0 da 10 a 20 Mega!   Risparmia co=
n Tutto Incluso: telefono + adsl 20 mega a soli 29,95 =E2=82=AC al mese per=
 due anni!  SCONTO DI 240 EURO!  http://abbonati.tiscali.it/telefono-adsl/p=
rodotti/tc/tuttoincluso/?WT.mc_id=3D01fw 


