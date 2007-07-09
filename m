Received: from [66.249.90.177] (helo=ik-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <pmiscml@gmail.com>) id 1I80lL-0007j8-Hi
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Jul 2007 23:27:19 +0200
Received: by ik-out-1112.google.com with SMTP id c30so675775ika
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Jul 2007 14:21:42 -0700 (PDT)
Received: by 10.78.81.20 with SMTP id e20mr1835184hub.1184016102724;
	Mon, 09 Jul 2007 14:21:42 -0700 (PDT)
Received: from ?192.168.20.110? ( [82.193.98.21])
	by mx.google.com with ESMTP id y2sm56552750mug.2007.07.09.14.21.40
	(version=SSLv3 cipher=OTHER); Mon, 09 Jul 2007 14:21:41 -0700 (PDT)
Date: Tue, 10 Jul 2007 00:21:28 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) UNREG / CD5BF9353B3B7091
X-Priority: 3 (Normal)
Message-ID: <1729618158.20070710002128@gmail.com>
To: "Dr. Michael Lauer" <mickey@vanille-media.de>
In-Reply-To: <849361116.20070709220136@vanille-media.de>
References: <513012886.20070708041151@gmail.com> <f6q30v$s2$1@sea.gmane.org>
	<128309124.20070709154303@gmail.com>
	<1183996538.5757.55.camel@localhost.localdomain>
	<849361116.20070709220136@vanille-media.de>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] Adding screen dimensions to machine configs
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
X-List-Received-Date: Mon, 09 Jul 2007 21:27:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Dr.,

Monday, July 9, 2007, 11:01:36 PM, you wrote:

> To summarize:

> It looks like we can agree to adding information to the
> MACHINE_DISPLAY_ namespace.

> However, we're undecided regarding the semantics. Some of think the
> physical hardware information need to be there, some of us want the
> logical (including kernel-level gfx hardware rotation), some of us
> want a high-level meaning.

> How do we proceed now? Collect more arguments in favour or against or
> shall we vote? Who is having a voice?

  I proposed to model variables in those namespace on the formfactor
package, and with Richard's and Marcin's explaining that there intention
was to have "physical" parameters, and with Graeme's vote, that's
apparently the way to go.

  From my side, proposal to use logical meaning was an RFC, and
choosing other semantics won't change situation much.

> Regards,

> :M:



-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



