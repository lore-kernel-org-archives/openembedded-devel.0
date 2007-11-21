Received: from [66.249.92.175] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <pmiscml@gmail.com>) id 1IuuXD-0005zZ-A5
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Nov 2007 19:42:51 +0100
Received: by ug-out-1314.google.com with SMTP id m3so184534ugc
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Nov 2007 10:40:35 -0800 (PST)
Received: by 10.66.243.4 with SMTP id q4mr778225ugh.1195667130185;
	Wed, 21 Nov 2007 09:45:30 -0800 (PST)
Received: from ?192.168.2.2? ( [88.231.78.200])
	by mx.google.com with ESMTPS id j33sm1372063ugc.2007.11.21.09.45.19
	(version=SSLv3 cipher=OTHER); Wed, 21 Nov 2007 09:45:29 -0800 (PST)
Date: Wed, 21 Nov 2007 19:45:13 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <745865018.20071121194513@gmail.com>
To: Rod Whitby <rod@whitby.id.au>
In-Reply-To: <4743C5B8.4030209@whitby.id.au>
References: <20071119120819.GA17788@lenovo>
	<47419EA0.4030308@student.utwente.nl>
	<4742217C.9060506@whitby.id.au>
	<74d0deb30711200112x17ad31fej4b25840a74e05abb@mail.gmail.com>
	<4743201F.8000202@am.sony.com> <617697824.20071121042405@gmail.com>
	<4743C5B8.4030209@whitby.id.au>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Getting Started -Makefile
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
X-List-Received-Date: Wed, 21 Nov 2007 18:42:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Rod,

Wednesday, November 21, 2007, 7:44:24 AM, you wrote:

> Paul Sokolovsky wrote:
>>    Why not default? Well, because what make builds is usually ones to
>> tens of megabytes, while bitbake builds tens to hundreds gigabytes.
>> Those who're brave to undertake such endeavour, are expected to get
>> some understanding of what they're going to be thru by learning and
>> doing some setup with their own hands.

[]

> And yes, we all agree with BitBake/OE was not designed for the "casual
> user" who has been forced to use it cause there is no other way (for
> example) to build an OpenMoko image or create a new application for
> OpenMoko.  But the reality of today is that there is a large number of
> such users, and they seem to prefer the convenience of the Makefiles.

  Nice! OpenMoko uses its Makefile on to of bitbake, Slug uses own
Makefile, Koen guy uses his autobuilder which he doesn't even bother
to publish, I use busyb on top of OE (http://linux-h4000.sourceforge.net/busyb/oe/).

   But what's the OE's and bitbake's problem with this? Because that's
how all Unix tools are used. What is the problem which needs to be
solved? If the problem formulates as "OE and bitbake sucks, because
I use Makefile on top of them", then it can as well stay that way -
everyone does use.

    If instead its "its hard for casual user to setup
a distro building environment", then we should be prepared to decide
what part of power and flexibility we're going to hide, if not remove,
from the users. I'd personally be glad to see extension of the user
base of OE, but if it would come at the expense of reduction of
*poweruser* base, that would be a bit said, so worth a bit of
planning.

> -- Rod



-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



