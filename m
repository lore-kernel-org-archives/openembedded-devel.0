Received: from [64.233.162.229] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1HQkNc-0001dS-V3
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Mar 2007 14:16:01 +0100
Received: by nz-out-0506.google.com with SMTP id m22so905209nzf
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Mar 2007 06:15:59 -0700 (PDT)
Received: by 10.35.27.1 with SMTP id e1mr11740357pyj.1173705356242;
	Mon, 12 Mar 2007 06:15:56 -0700 (PDT)
Received: from cube ( [82.193.98.7])
	by mx.google.com with ESMTP id m2sm8262194nzf.2007.03.12.06.15.54;
	Mon, 12 Mar 2007 06:15:55 -0700 (PDT)
Date: Mon, 12 Mar 2007 15:15:54 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <150987567.20070312151554@gmail.com>
To: Nicola Ranaldo <ranaldo@unina.it>
In-Reply-To: <200703121409.49063.ranaldo@unina.it>
References: <1173049360.27812@gatekeeper.stellarwerx.com>
	<200703121409.49063.ranaldo@unina.it>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Fixing QA Errors?
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
X-List-Received-Date: Mon, 12 Mar 2007 13:16:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Nicola,

Monday, March 12, 2007, 3:09:48 PM, you wrote:

> On Monday 05 March 2007 00:02:41 Mark Gollahon wrote:
>> Koen:
>>
>> I've tried several different combinations for the FILES_ stuff, but I am
>> still getting both errors.  Since the errors show up when QA checking the
>> libqtaux2 package (as opposed to checking the *-dev, *-doc, etc.,
>> packages), could this be more of a problem of the files not getting
>> installed to the right place, or is that what the FILES_* spec is supposed
>> to do?

> Try putting thos lines *before* the others.
> This worked for me on librsvg.

> Howewer is it planned to fix all the qa issues on the repository or have we to
> open a bug for every qa related question?

  Open bug, attach patch. Feel free to open one bug for fix to a bunch
of recipes ;-)

>         Niko



-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



