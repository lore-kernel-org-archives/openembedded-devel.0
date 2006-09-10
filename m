Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <lenehan@twibble.org>) id 1GMIJf-0007kM-NH
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Sep 2006 07:57:16 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id 59DD3A9711
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Sep 2006 15:54:02 +1000 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 17706-07
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Sep 2006 15:54:00 +1000 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id AF648A278C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Sep 2006 15:54:00 +1000 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id 81F2AFE0507; Sun, 10 Sep 2006 15:54:00 +1000 (EST)
Date: Sun, 10 Sep 2006 15:54:00 +1000
From: Jamie Lenehan <lenehan@twibble.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20060910055359.GA24278@twibble.org>
Mail-Followup-To: Jamie Lenehan <lenehan@twibble.org>,
	openembedded-devel@lists.openembedded.org
References: <E1GLgJs-0001ek-EZ@linuxtogo.org>
Mime-Version: 1.0
In-Reply-To: <E1GLgJs-0001ek-EZ@linuxtogo.org>
User-Agent: Mutt/1.4.2.1i
X-Virus-Scanned: by amavisd at twibble.org
Subject: Re: [oe-commits] org.oe.dev hostap-daemon and madwifi: fix compatibility problems on mtx platforms
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
X-List-Received-Date: Sun, 10 Sep 2006 05:57:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 08, 2006 at 03:22:56PM +0200, "MartinDietze commit" wrote:
[...]
> packages/madwifi/madwifi-modules_cvs-bsd.bb
> packages/madwifi/madwifi-modules_cvs.bb

Are you actually using these? 

The CVS URL's in them don't appear valid and I believe everyone else
is now using the SVN snapshots. I had been planning on deleting these
cvs files.

-- 
 Jamie Lenehan <lenehan@twibble.org>


