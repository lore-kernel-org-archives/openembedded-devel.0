Received: from [141.2.4.18] (helo=mail.tm.informatik.uni-frankfurt.de)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <mickey@tm.informatik.uni-frankfurt.de>)
	id 1GMj1u-00007H-58 for openembedded-devel@lists.openembedded.org;
	Mon, 11 Sep 2006 12:28:42 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.tm.informatik.uni-frankfurt.de (Postfix) with ESMTP id D42C49A0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Sep 2006 12:25:22 +0200 (CEST)
Received: from mail.tm.informatik.uni-frankfurt.de ([127.0.0.1])
	by localhost (mail [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 30691-02 for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Sep 2006 12:25:19 +0200 (CEST)
Received: from [141.2.14.64] (gandalf.tm.informatik.uni-frankfurt.de
	[141.2.14.64])
	by mail.tm.informatik.uni-frankfurt.de (Postfix) with ESMTP id 663BF998
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Sep 2006 12:25:19 +0200 (CEST)
From: Michael 'Mickey' Lauer <mickey@tm.informatik.uni-frankfurt.de>
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <5144EF5B0ABC6745BEE64C74E43ABD8F11A135@moneypenny.softoption.local>
References: <5144EF5B0ABC6745BEE64C74E43ABD8F11A135@moneypenny.softoption.local>
Organization: VanilleMedia
Date: Mon, 11 Sep 2006 12:25:19 +0200
Message-Id: <1157970319.23514.2.camel@gandalf.tm.informatik.uni-frankfurt.de>
Mime-Version: 1.0
X-Mailer: Evolution 2.7.2.1-3mdv2007.0 
X-Virus-Scanned: by amavisd-new at tm.informatik.uni-frankfurt.de
Subject: Re: Quick question on SRC_URI in bitbake files
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
X-List-Received-Date: Mon, 11 Sep 2006 10:28:42 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Am Montag, den 11.09.2006, 10:27 +0100 schrieb Mark Howells:
> Does anyone know how I can tell bitbake how to use the Mercurial repository manager to get sources (rather than http,ftp, cvs etc). In particular I want to get make a bb file that knows how to build the dvb drivers at HYPERLINK "http://www.linuxtv.org"www.linuxtv.org - it's a real pain (and somewhat contrary to the whole idea) to have to pre-download an image manually. I guess I want to be able to define a do_unpack() method...

That sounds rather like you want to add a new fetcher (for mercurial
repositories) in bitbake.

-- 
Regards,

Michael 'Mickey' Lauer | FreeLancer | http://www.Vanille-Media.de




