Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jkridner@beagleboard.org>) id 1OniGN-0002Do-7H
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Aug 2010 03:25:47 +0200
Received: by wwi14 with SMTP id 14so916806wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Aug 2010 18:24:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.216.87.208 with SMTP id y58mr5177117wee.82.1282613083167; Mon,
	23 Aug 2010 18:24:43 -0700 (PDT)
Received: by 10.216.206.138 with HTTP; Mon, 23 Aug 2010 18:24:43 -0700 (PDT)
In-Reply-To: <i4tcbm$qie$2@dough.gmane.org>
References: <1282248521-32053-1-git-send-email-jkridner@beagleboard.org>
	<1282256264-4206-1-git-send-email-jkridner@beagleboard.org>
	<i4tcbm$qie$2@dough.gmane.org>
Date: Mon, 23 Aug 2010 21:24:43 -0400
Message-ID: <AANLkTin-=_HU5fDgpRhs1vLgBaLm8UpEpL8HskwXdco8@mail.gmail.com>
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Rcpt-To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Mail-From: jkridner@beagleboard.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] base-files: beagleboard: profile: use nano
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
X-List-Received-Date: Tue, 24 Aug 2010 01:25:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Aug 23, 2010 at 4:43 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> On 20-08-10 00:17, Jason Kridner wrote:
>> If nano is available and EDITOR isn't otherwise set, then use it.
>> Advanced users who would prefer vi will know how to set EDITOR anyway.
>> I can clearly see myself being frustrated typing 'export EDITOR=vi'
>> every time I start a BeagleBoard test ramdisk image, but better me have
>> that than to try to explain to someone fresh how to use vi.
>>
>> Updated with feedback from Gary Thomas to avoid overwriting anyone
>> else's preference.
>>
>
> NAK, this is a distro setting, not a machine setting.

Would this be accepted if it were a patch to Angstrom?


