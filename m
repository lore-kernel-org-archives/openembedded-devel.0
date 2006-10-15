Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <lenehan@twibble.org>) id 1GYu1O-00046n-3W
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 Oct 2006 02:38:30 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id A6956808F8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Oct 2006 10:31:52 +1000 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 13395-03
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Oct 2006 10:31:49 +1000 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id 073621BBEC
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Oct 2006 10:31:49 +1000 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id EFF7512914FA; Sun, 15 Oct 2006 10:31:48 +1000 (EST)
Date: Sun, 15 Oct 2006 10:31:48 +1000
From: Jamie Lenehan <lenehan@twibble.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20061015003148.GA12655@twibble.org>
Mail-Followup-To: Jamie Lenehan <lenehan@twibble.org>,
	openembedded-devel@lists.openembedded.org
References: <698474498.20061013195107@gmail.com>
	<20061013173454.GA25324@mage.jpl.nasa.gov>
	<137495124.20061014162300@gmail.com>
	<20061014151143.GA15562@hovland.org>
	<74d0deb30610140817w417b787dpa80f702436bf136a@mail.gmail.com>
	<20061014153521.GB15562@hovland.org>
	<1160854551.1649.1.camel@gandalf.tm.informatik.uni-frankfurt.de>
	<45313D68.6030509@dominion.kabel.utwente.nl>
	<432beae0610141538p3b722a9bx552942eeac2d44ff@mail.gmail.com>
	<20061015002837.GA12632@twibble.org>
Mime-Version: 1.0
In-Reply-To: <20061015002837.GA12632@twibble.org>
User-Agent: Mutt/1.4.2.1i
X-Virus-Scanned: by amavisd at twibble.org
Subject: Re: OT: why cc:?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 15 Oct 2006 00:38:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Oct 15, 2006 at 10:28:37AM +1000, Jamie Lenehan wrote:
[...]
> What are these non-"lists" address you talk about and what are these
> duplicates? I don't seem to see any?

Oh, I think I see what those duplicates are now... I have had this in
my .procmailrc for ever:

 #
 # Weed out duplicates...
 #
 :0 Whc: $HOME/Mail/msgid.lock
 | formail -D 65536 $HOME/Mail/cache.dupes
 :0 a:
 dupes

which means I never see duplicates. So I take the duplicates you are
talking about happen from emails being sent to both
openembedded-devel@lists.openembedded.org and
openembedded-devel@openembedded.org ?

-- 
 Jamie Lenehan <lenehan@twibble.org>


