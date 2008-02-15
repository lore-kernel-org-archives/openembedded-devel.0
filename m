Received: from [209.85.146.181] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <slapinid@gmail.com>) id 1JPzd0-0008UK-NG
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Feb 2008 13:25:21 +0100
Received: by wa-out-1112.google.com with SMTP id l24so1200188waf.22
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Feb 2008 04:25:02 -0800 (PST)
Received: by 10.114.154.1 with SMTP id b1mr2840638wae.34.1203078302233;
	Fri, 15 Feb 2008 04:25:02 -0800 (PST)
Received: by 10.65.123.17 with HTTP; Fri, 15 Feb 2008 04:25:02 -0800 (PST)
Message-ID: <48239d390802150425o4e4faef4y62f3501842af57ee@mail.gmail.com>
Date: Fri, 15 Feb 2008 15:25:02 +0300
From: "Sergey Lapin" <slapinid@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200802151246.44196.mickey@vanille-media.de>
MIME-Version: 1.0
References: <200802131340.02616.mickey@vanille-media.de>
	<200802131432.42455.mickey@vanille-media.de>
	<47B3075F.4000703@student.utwente.nl>
	<200802151246.44196.mickey@vanille-media.de>
X-SA-Exim-Connect-IP: 209.85.146.181
X-SA-Exim-Mail-From: slapinid@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: tinylogin vs. busybox
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
X-List-Received-Date: Fri, 15 Feb 2008 12:25:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, Feb 15, 2008 at 2:46 PM, Michael 'Mickey' Lauer
<mickey@vanille-media.de> wrote:
>  > , but frankly, I trust
>  > busybox as far as I can throw a piano (and toybox as far as I can throw
>  > a 21" crt) and SUID root binaries make my skin crawl, so we must be very
>  > carefull and do thorough tests before making this change.
>  > The last thing we want is $bigcompany to blame OE for the exploitabilty
>  > of their devices.
>
>  Sure, better safe than sorry. Of course this would not be the default in
>  OE.dev without being tested for quite some time.
Well, is it great idea to replace tinylogin with busybox-suid (which
should contain
carefully selected applets and properly tested)?


