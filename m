Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1N2N4j-000467-4l
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Oct 2009 11:45:24 +0100
Received: from tamarin.localnet (123-192-145-111.dynamic.kbronet.com.tw
	[123.192.145.111])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id DAAF41B10C04
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Oct 2009 10:53:44 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Oct 2009 11:44:00 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <ec1f3d400910230421r4509e19amc899870bdd640ce5@mail.gmail.com>
	<ec1f3d400910260325i54971290u914ff2c0a6ca301d@mail.gmail.com>
In-Reply-To: <ec1f3d400910260325i54971290u914ff2c0a6ca301d@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200910261144.00888.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [help] openembedded tarball sources on HTTP
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
X-List-Received-Date: Mon, 26 Oct 2009 10:45:24 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday 26 October 2009 11:25:09 RK Raggit wrote:
> anyone with some idea on this .. ? sorry for pushing , but i am kind of
> evaluating OE and would like to know whether this is possible at all ?
> 
> ...unblocking cvs,svn ports is defnitely not an option for me.

then find a better place to work at. If your company does not allow you to do 
your work something is wrong with the company.

Your options are (I have done most of them):

	1.) Use bitbake -cfetchall WHAT_YOU_WANT 
		1.1.0) Do it at home and take the result to the office
		1.1.1) Rent a separate DSL line for your office and download yourself
                         (obviously never be connected to both networks 
                          *giggle*)
                1.1.2) Use your UMTS dataplan to download the source
		1.1.3) Go to a public hotspot to download
		1.1.4) Rent a hotel room on company cost and download
                          from there.
	2.) Switch recipes that use CVS/SVN/GIT to the closest release, you
              can do this by toggling PREFERRED_VERSION of these recipes
	3.)  You can ask someone to send you a tape with the sources.


In general with Free Software you will have to have the real internet to be 
able to work.

love
	z.



