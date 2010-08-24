Received: from vms173005pub.verizon.net ([206.46.173.5])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@rkmorris.us>) id 1OnksU-0005BR-7P
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Aug 2010 06:12:51 +0200
Received: from server ([unknown] [71.170.86.183]) by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L7M003VLZJZBF00@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	23 Aug 2010 22:12:07 -0500 (CDT)
Received: from server [127.0.0.1] by server (Axigen)
	with ESMTPSA id 2FCCEE; Mon, 23 Aug 2010 22:11:48 -0500
Received: from [192.168.1.3] by rkmorris.us with HTTP; Mon,
	23 Aug 2010 22:11:47 -0500
From: <openembedded@rkmorris.us>
Date: Mon, 23 Aug 2010 22:11:47 -0500
X-Mailer: Axigen WebMail
To: openembedded-devel@lists.openembedded.org
Message-id: <1282619507633564500@rkmorris.us>
Importance: Normal
MIME-version: 1.0
X-AxigenVirus-Level: 1
X-AxigenSpam-Level: 4
X-SA-Exim-Connect-IP: 206.46.173.5
X-SA-Exim-Rcpt-To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Mail-From: openembedded@rkmorris.us
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=AWL,BAYES_05,HTML_MESSAGE
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Build Directory inside conf
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
X-List-Received-Date: Tue, 24 Aug 2010 04:12:52 -0000
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,
One item that may need to be cleaned up - there seems to be a copy of "bui=
ld=E2=80=8B" inside "conf".
Thanks.
From fransmeulenbroeks@gmail.com Tue Aug 24 08:32:34 2010
Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Onn3h-0004zq-Jg
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Aug 2010 08:32:34 +0200
Received: by gya6 with SMTP id 6so2554636gya.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Aug 2010 23:32:04 -0700 (PDT)
DKIM-Signature: v
