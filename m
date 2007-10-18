Received: from [209.85.146.177] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <cliff.brake@gmail.com>) id 1IiMZ7-0001wV-Nx
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Oct 2007 06:00:57 +0200
Received: by wa-out-1112.google.com with SMTP id l24so56304waf
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2007 20:54:18 -0700 (PDT)
Received: by 10.114.153.18 with SMTP id a18mr42687wae.1192676281737;
	Wed, 17 Oct 2007 19:58:01 -0700 (PDT)
Received: by 10.114.191.17 with HTTP; Wed, 17 Oct 2007 19:58:01 -0700 (PDT)
Message-ID: <f96d234e0710171958s60ad2e4fqab00437374cd0d1@mail.gmail.com>
Date: Wed, 17 Oct 2007 22:58:01 -0400
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <47168FE0.5020701@balister.org>
MIME-Version: 1.0
References: <47163EAF.7040000@student.utwente.nl>
	<074296F4-56B3-4F1A-B0F1-8BE61670722A@gumstix.com>
	<471666C6.5050809@student.utwente.nl>
	<0FBF6426-46EC-4E71-92E7-A1C29B31C6D5@gumstix.com>
	<47168FE0.5020701@balister.org>
Subject: Re: COMPILE_FEATURES?
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
X-List-Received-Date: Thu, 18 Oct 2007 04:00:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 10/17/07, Philip Balister <philip@balister.org> wrote:
> In #oe I extracted the answer as follows, with a use flag type thingy,
> two builds of the same package could have very different packages,
> primarily in the area of dependencies.
>
> Philip
>
> PS: I have no clue what USE flags are, and I am not a packaging guru.
> I'm sure my possible wrong answer will get a better explanation.

USE flags are used in Gentoo.  Gentoo and OE somewhat similar in that
they are composed of a bunch of recipes that describe primarily how to
build software, but that's about it.

http://www.gentoo.org/doc/en/handbook/handbook-x86.xml?part=2&chap=2

Bitbake was actually derived from portage:

Chris Larson quote: "it (bitbake) gradually developed a tendency
toward the most flexible
of all implementations, so became a generic task execution and metadata
handling tool that had some remnants from the Gentoo Portage codebase
that it was derived from."

A little more history:
http://lists.berlios.de/pipermail/bitbake-dev/2005-May/000028.html
http://lists.berlios.de/pipermail/bitbake-dev/2005-May/thread.html#29

Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


