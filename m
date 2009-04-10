Received: from [76.96.30.40] (helo=QMTA04.emeryville.ca.mail.comcast.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enelson1000@comcast.net>) id 1Ls6Wv-0005L3-Iq
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Apr 2009 04:31:48 +0200
Received: from OMTA13.emeryville.ca.mail.comcast.net ([76.96.30.52])
	by QMTA04.emeryville.ca.mail.comcast.net with comcast
	id dVC81b00517UAYkA4eUXl5; Fri, 10 Apr 2009 02:28:31 +0000
Received: from edshome ([71.198.120.50])
	by OMTA13.emeryville.ca.mail.comcast.net with comcast
	id deUW1b00915LFXK8ZeUWGc; Fri, 10 Apr 2009 02:28:31 +0000
From: "ed nelson" <enelson1000@comcast.net>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 9 Apr 2009 19:28:30 -0700
Message-ID: <26925465C0D24F9AAA4610C4CD411DE3@edshome>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 11
Thread-Index: Acm5hAm2R65Bv9iqT6GMILWr+N98jg==
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.5579
X-SA-Exim-Connect-IP: 76.96.30.40
X-SA-Exim-Mail-From: enelson1000@comcast.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_50,HTML_MESSAGE,
	RDNS_NONE,SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: What is the best approach when defconfig is changed
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
X-List-Received-Date: Fri, 10 Apr 2009 02:31:48 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

I built a console-image without any failures.  I now want to use a different
defconfig file (made minor change). Do I need to delete the tmp dir and do a
new console-image build or is there a better way to handle this.

 

Thanks

ed


