Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <lenehan@twibble.org>) id 1Gn1Qg-0008Uz-Ep
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Nov 2006 00:22:58 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id CB1D9BD507
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Nov 2006 10:20:03 +1100 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 05400-05
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Nov 2006 10:20:02 +1100 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id 1478DBD506
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Nov 2006 10:20:02 +1100 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id 0B6F915EBF46; Thu, 23 Nov 2006 10:20:02 +1100 (EST)
Date: Thu, 23 Nov 2006 10:20:02 +1100
From: Jamie Lenehan <lenehan@twibble.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20061122232001.GA20265@twibble.org>
Mail-Followup-To: Jamie Lenehan <lenehan@twibble.org>,
	openembedded-devel@lists.openembedded.org
References: <20061120043254.GA19760@twibble.org>
	<1616846329.20061122174526@gmail.com>
	<20061122230754.GA20164@twibble.org>
	<4564D92B.6080500@dominion.kabel.utwente.nl>
Mime-Version: 1.0
In-Reply-To: <4564D92B.6080500@dominion.kabel.utwente.nl>
User-Agent: Mutt/1.4.2.1i
X-Virus-Scanned: by amavisd at twibble.org
Subject: Re: Changes to populate-volatile.sh / new volatiles class
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
X-List-Received-Date: Wed, 22 Nov 2006 23:22:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 23, 2006 at 12:11:39AM +0100, Koen Kooi wrote:
> Jamie Lenehan schreef:
> > That update-alternatives thing on the
> > other hand I have definately been thinking about redoing in C when I
> > get a chance - it's painfully slow.
> 
> The good folks from o-hand.conf gave us this:
> http://www.openembedded.org/filebrowser/org.openembedded.dev/packages/update-alternatives
> 
> I think it would be wise to move to the dpkg version and if that's still to slow, re-do it
> in C.

The big issue I see with the dpkg version is that it's written in
perl... I think I'd prefer to have a slow version then be forced to
always install perl ;)

-- 
 Jamie Lenehan <lenehan@twibble.org>


