Received: from [209.85.198.191] (helo=rv-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <cliff.brake@gmail.com>) id 1InIYA-0002on-QP
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Oct 2007 19:44:23 +0100
Received: by rv-out-0910.google.com with SMTP id c24so201952rvf
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Oct 2007 11:43:42 -0700 (PDT)
Received: by 10.141.35.21 with SMTP id n21mr4048042rvj.1193849252617;
	Wed, 31 Oct 2007 09:47:32 -0700 (PDT)
Received: by 10.141.203.2 with HTTP; Wed, 31 Oct 2007 09:47:32 -0700 (PDT)
Message-ID: <f96d234e0710310947jdf0c2bbh3fe6bf13a98b2644@mail.gmail.com>
Date: Wed, 31 Oct 2007 12:47:32 -0400
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <A0AACB011FF0474492071F3E72FB188F072045CD@USSYML02.ad.sjm.com>
MIME-Version: 1.0
References: <A0AACB011FF0474492071F3E72FB188F072045CD@USSYML02.ad.sjm.com>
Subject: Re: *Very* newbie question: OE and Cygwin?
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
X-List-Received-Date: Wed, 31 Oct 2007 18:44:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 10/30/07, Tiller, Jason <jtiller@sjm.com> wrote:

> [Main question: Can I use OE on cygwin to target a PXA270-based board?]

I suspect you would be better off running Linux (ubuntu/debian, etc)
on a vmware virtual machine.  I've not tried cygwin, but just based on
the complexity of everything happening, it seems unlikely it will work
without a lot of hassle.

> I'm evaluating a new microprocessor for a next-generation power
> generator.  We hope to use a linux kernel inside the instrument.  I'm
> using a Logic Devices PXA270-based Zoom eval board.  I saw on one of
> the LD boards that OE has support for this micro/board combination.
> I'd like to try OE to build a kernel and throw up some simple apps,
> but I have to do the host development in Windows, which means Cygwin.

Good luck with your project.

Several of us have PXA270 Zoom boards.  The #oe irc channel on
freenode is a good resource if you need help getting started.

Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


