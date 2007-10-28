Received: from [62.169.194.61] (helo=memova2.tellas.gr)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <skoroneos@digital-opsis.com>) id 1Im3HY-00035n-Ji
	for openembedded-devel@openembedded.org; Sun, 28 Oct 2007 09:14:04 +0100
Received: from dias (62.169.211.226) by memova2.tellas.gr (7.3.118.8)
	id 4638635B04AAB2E1 for openembedded-devel@openembedded.org;
	Sun, 28 Oct 2007 09:05:09 +0100
From: "Stelios Koroneos" <skoroneos@digital-opsis.com>
To: <openembedded-devel@openembedded.org>
Date: Sun, 28 Oct 2007 10:06:24 +0200
Message-ID: <HOECLKEKOHLAMMGDLLBHAEIDMKAA.skoroneos@digital-opsis.com>
MIME-Version: 1.0
X-Priority: 3 (Normal)
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook IMO, Build 9.0.2416 (9.0.2911.0)
In-Reply-To: <1193522957.6376.125.camel@toontown>
Importance: Normal
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.3138
Subject: Re: getting started - docbook
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
X-List-Received-Date: Sun, 28 Oct 2007 08:14:05 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

> In my humble opinion that is way out of scope for a OE documentation.
> The point is to present the workings and functionalities of OpenEmbedded
> and not how to get some arbitrary hardware to run linux from 0 to
> 100% .. ?
>
> At least that is my conception of what the OE documentation should
> provide?


We discussed the documentation matter in OEDEM.
What we "concluded" to is that there can not be a single document to cover
all of OE
The idea was to see how we can get a "Getting started guide" where the basic
functionality of OE is covered and a "Programmers/Developers manual" kind of
thing where all big and little dirty details of OE should go to.

These two documents target different kind of people with different needs.
The people who would like to use OE with an existing device/distro by simply
building an image and/or want to develop/port an application (without
messing too much with the OE internals) and those who need to add a new
device/distro/extend OE in whatever manner they need

IMHO there is a need to get documentation for the larger pool of
"application developers" first and move into the detailed "board/distro
developers" at a second stage, as we are going to see more and more of the
first, as OE gets shipped with more and more devices.
And with the SDK needing some "final touches" to be functional , we are
bound to see more and more people asking questions that are "application
developer" oriented, so we better be prepared for that.



Stelios S. Koroneos

Digital OPSiS - Embedded Intelligence
http://www.digital-opsis.com






