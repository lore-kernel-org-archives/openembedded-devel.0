Received: from [66.7.219.172] (helo=hostdime.freedom.ind.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@freedom.ind.br>) id 1KjgCU-0007h8-P8
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Sep 2008 22:15:34 +0200
Received: from freedom.ind.br (unknown [10.99.0.10])
	by hostdime.freedom.ind.br (Postfix) with ESMTP id D789A3343BE
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Sep 2008 17:11:39 -0300 (BRT)
Received: from freedom.ind.br (localhost [127.0.0.1])
	by freedom.ind.br (Postfix) with ESMTP id 02E518C61BB
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Sep 2008 17:11:47 -0300 (BRT)
Received: from internet.ossystems.com.br (localhost [127.0.0.1])
	by freedom.ind.br (Postfix) with ESMTP id CD5148C29D7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Sep 2008 17:11:46 -0300 (BRT)
Received: from internet.ossystems.com.br ([201.40.162.47]
	helo=internet.ossystems.com.br)
	by mail.freedom.ind.br; 27 Sep 2008 17:11:46 -0300
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id 90BCFC270
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Sep 2008 17:11:41 -0300 (BRT)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id D20F7610045; Sat, 27 Sep 2008 17:09:30 -0300 (BRT)
To: openembedded-devel@lists.openembedded.org
From: Otavio Salvador <otavio@debian.org>
Organization: O.S. Systems Ltda.
X-URL: http://www.debian.org/~otavio/
X-Attribution: O.S.
Date: Sat, 27 Sep 2008 17:09:30 -0300
Message-ID: <87abdtcpvp.fsf@neumann.lab.ossystems.com.br>
User-Agent: Gnus/5.11 (Gnus v5.11) Emacs/22.2 (gnu/linux)
MIME-Version: 1.0
Subject: fennec fails to build when host system lacks autoconf2.13
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
X-List-Received-Date: Sat, 27 Sep 2008 20:15:35 -0000
Content-Type: text/plain; charset=us-ascii

Hello,

It takes a while until I found the reason fennec was failing to build;
it needs autoconf2.13 but OE doesn't has it anymore.

Does someone feels like fixing it?
 
-- 
        O T A V I O    S A L V A D O R
---------------------------------------------
 E-mail: otavio@debian.org      UIN: 5906116
 GNU/Linux User: 239058     GPG ID: 49A5F855
 Home Page: http://otavio.ossystems.com.br
---------------------------------------------
"Microsoft sells you Windows ... Linux gives
 you the whole house."


