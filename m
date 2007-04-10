Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HbHV5-0006wd-Mx
	for openembedded-devel@openembedded.org; Tue, 10 Apr 2007 16:39:18 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l3AEdFVQ027623
	for <openembedded-devel@openembedded.org>;
	Tue, 10 Apr 2007 15:39:15 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27324-07 for <openembedded-devel@openembedded.org>;
	Tue, 10 Apr 2007 15:39:10 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l3AEd674027609
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Tue, 10 Apr 2007 15:39:06 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <3ef3a7ad0704100602v610f6c10k447a1551f79ca750@mail.gmail.com>
References: <evcm2e$15q$1@sea.gmane.org>
	<1176155636.5842.25.camel@localhost.localdomain>
	<432beae0704091515n6a55a294jfdf64c9e855b9537@mail.gmail.com>
	<3ef3a7ad0704100602v610f6c10k447a1551f79ca750@mail.gmail.com>
Date: Tue, 10 Apr 2007 15:39:05 +0100
Message-Id: <1176215946.5809.90.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	l3AEdFVQ027623
Subject: Re: OE a deterministic build system?
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
X-List-Received-Date: Tue, 10 Apr 2007 14:39:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, 2007-04-10 at 14:02 +0100, Jos=E9 Bernardo Bandos Rodrigues wrote=
:
> Are you by any chance using ubuntu? If so, do a "sudo dpkg-reconfigure =
dash"
> and stop it replacing /bin/sh.
> That was the reason for most of the problems I had with oe, including a
> couple of "undefined reference to main".

Can someone make sanity.bbclass detect dash and exit with a
warning/error? :)

Cheers,

Richard



