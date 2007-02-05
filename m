Received: from [209.242.20.70] (helo=green.dls.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <mwester@dls.net>) id 1HE67J-0002PN-MF
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Feb 2007 16:50:53 +0100
Received: from twilight (gw.mwester.net [209.242.5.110])
	by green.dls.net (Postfix) with ESMTP id A7483411CC6
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Feb 2007 09:50:56 -0600 (CST)
Message-ID: <05a501c7493d$57088f80$6e01a8c0@twilight>
From: "Mike \(mwester\)" <mwester@dls.net>
To: <openembedded-devel@lists.openembedded.org>
References: <45C6E906.9090602@whitby.id.au>
	<1117807882.20070205132135@vanille-media.de>
Date: Mon, 5 Feb 2007 09:50:20 -0600
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2800.1807
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2800.1896
Subject: Re: How will OE handle the US timezone change?
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
X-List-Received-Date: Mon, 05 Feb 2007 15:50:53 -0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

> Rod Whitby wrote:
> > Not that I really care (not living in the US), but people using distros
> > built from OE are getting concerned about how the new US DST timezone
> > thing is going to be handled.
>
> I must have missed that news -- what did they do?

The energy act of 2005 changed DST to begin earlier and end later.  This
change is not limited to the US.  I expect the impact to Bermuda to be
minimal -- I think timezones fade to insignificance when sitting on the
beach in the sunshine, with a cold drink in hand.  However, the change also
affects Canada.

Based on a cursory look, the existing timezone-* packages are significantly
out-of-date, so this particular DST change is only the most recent of the
ones it probably missed.  Perhaps the lack of feedback on this is an
indication that the timezone packages are not in widespread use.

Mike (mwester)




