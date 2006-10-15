Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <lenehan@twibble.org>) id 1GYu73-0004Ca-79
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 Oct 2006 02:44:21 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id C6C3082BD4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Oct 2006 10:37:43 +1000 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 13522-04
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Oct 2006 10:37:42 +1000 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id 7F0C24A9E4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Oct 2006 10:37:42 +1000 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id 7A4AA12A9CA6; Sun, 15 Oct 2006 10:37:42 +1000 (EST)
Date: Sun, 15 Oct 2006 10:37:42 +1000
From: Jamie Lenehan <lenehan@twibble.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20061015003742.GB12679@twibble.org>
Mail-Followup-To: Jamie Lenehan <lenehan@twibble.org>,
	openembedded-devel@lists.openembedded.org
References: <E1GYf1g-00024R-9w@linuxtogo.org>
Mime-Version: 1.0
In-Reply-To: <E1GYf1g-00024R-9w@linuxtogo.org>
User-Agent: Mutt/1.4.2.1i
X-Virus-Scanned: by amavisd at twibble.org
Subject: Re: [oe-commits] org.oe.dev strace: bump pr after last patch
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
X-List-Received-Date: Sun, 15 Oct 2006 00:44:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 14, 2006 at 10:37:48AM +0200, "koen commit" wrote:
> strace: bump pr after last patch

Was there some reason for this? (Just to make sure I didn't miss
something!) In this case it had no effect on any existing strace
build (the change is a no-op for glibc < 2.5) and since glibc 2.5
didn't build previously it can't have had any change on glibc 2.5
built strace's...

-- 
 Jamie Lenehan <lenehan@twibble.org>


