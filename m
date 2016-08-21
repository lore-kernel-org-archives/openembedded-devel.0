Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from blaine.gmane.org (unknown [195.159.176.226])
	by mail.openembedded.org (Postfix) with ESMTP id BE5D66FFCD
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Aug 2016 08:37:05 +0000 (UTC)
Received: from list by blaine.gmane.org with local (Exim 4.84_2)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1bbOFb-00016W-KS for openembedded-devel@lists.openembedded.org;
	Sun, 21 Aug 2016 10:37:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sun, 21 Aug 2016 10:36:58 +0200
Message-ID: <npbp79$gm9$1@blaine.gmane.org>
References: <1471640436-11211-1-git-send-email-gyurco@freemail.hu>
Mime-Version: 1.0
X-Complaints-To: usenet@blaine.gmane.org
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.2.0
In-Reply-To: <1471640436-11211-1-git-send-email-gyurco@freemail.hu>
Subject: Re: [meta-webserver][PATCHv3 2/2] nginx.inc: use 4 spaces for indentation
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 21 Aug 2016 08:37:07 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Op 19-08-16 om 23:00 schreef Gyorgy Szombathelyi:
> From: Martin Jansa <Martin.Jansa@gmail.com>
> 
> * like any other sane recipes do

Please don't touch indentation for variables (FILES*, SRC_URI, etc) and only
fix the shell and python methods.



