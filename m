Received: from [64.233.182.188] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <pmiscml@gmail.com>) id 1IfILg-0001OU-Hc
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Oct 2007 18:54:24 +0200
Received: by nf-out-0910.google.com with SMTP id h3so1235610nfh
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Oct 2007 09:48:36 -0700 (PDT)
Received: by 10.86.86.12 with SMTP id j12mr6148403fgb.1191948515320;
	Tue, 09 Oct 2007 09:48:35 -0700 (PDT)
Received: from ?192.168.20.110? ( [82.193.99.2])
	by mx.google.com with ESMTPS id e32sm13971706fke.2007.10.09.09.48.34
	(version=SSLv3 cipher=OTHER); Tue, 09 Oct 2007 09:48:34 -0700 (PDT)
Date: Tue, 9 Oct 2007 19:48:33 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <774183395.20071009194833@gmail.com>
To: Cliff Brake <openembedded-devel@lists.openembedded.org>
In-Reply-To: <f96d234e0710081320s567bf1bfie56eebca83afb6b2@mail.gmail.com>
References: <1191494488.2516.34.camel@toontown> <4704CC05.40206@klever.net>
	<B9AD73C2-790F-43EE-9FC4-96F1B1FA9415@selfish.org>
	<1191502502.2516.39.camel@toontown>
	<EB5E2840-5F10-45F9-8B97-9FCFDC7F5AAE@selfish.org>
	<D61182AC8012EA4EBC531B3AF23BE10947F630@tranzeo-mail2.12stewart.tranzeo.com>
	<4704F01B.70104@klever.net> <4705D99D.6070209@miromico.ch>
	<f96d234e0710050657lbbf7391tb2437588f9c93d31@mail.gmail.com>
	<f96d234e0710081320s567bf1bfie56eebca83afb6b2@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: oe for two target boards at the same time
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
X-List-Received-Date: Tue, 09 Oct 2007 16:54:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Cliff,

Monday, October 8, 2007, 11:20:14 PM, you wrote:

> On 10/5/07, Cliff Brake <cliff.brake@gmail.com> wrote:
>> On 10/5/07, Alex <mailinglist@miromico.ch> wrote:
>> > Hi all
>> >
>> > How do I setup my directory structure to use oe for two target boards.
>> >
>> > I have an AVR32 board and an AT91 board and would like to use oe for
>> > both of them with at less dublicated software as possible.

>> I'd be interested in hearing how others set up their build directory.

> After studying Marcin's build setup, and Koen's autobuilder script,

  Is there a reason why this script is not in contrib/ in OE tree?

[]

> - easily to automatically produce time-stamped snapshot builds (not done yet)

  I wonder if someone would ever bother to produce *revision*-stamped
snapshots. Well, actually I wonder if in one sweet day in distant
years OE would have that as default. Because it's of course the only
reasonable way to ensure QAbility of snapshots. Yep, mtn's revisions
are ugly, but that's price of "distributed SCM" magic, right? Plus,
they can be trimmed to sane length.

[]

-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



