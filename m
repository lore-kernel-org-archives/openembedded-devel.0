Received: from [66.111.4.27] (helo=out3.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rod@whitby.id.au>) id 1KlBGf-0002PI-3y
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Oct 2008 01:38:05 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id C0BF717241E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Oct 2008 19:33:55 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Wed, 01 Oct 2008 19:33:55 -0400
X-Sasl-enc: f2CAv5QAOg2OiNPLS21RaaPKwpKsfwRBMlOLQZ4wPOQa 1222904035
Received: from [192.168.1.11] (secure.astc-design.com [203.122.250.137])
	by mail.messagingengine.com (Postfix) with ESMTPSA id D082015B70
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Oct 2008 19:33:54 -0400 (EDT)
Message-ID: <48E408DC.80509@whitby.id.au>
Date: Thu, 02 Oct 2008 09:03:48 +0930
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.16 (Windows/20080708)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <48E36C18.4090504@smartlink.ee>	<873ajglc0d.fsf@neumann.lab.ossystems.com.br>	<48E3762E.6000203@smartlink.ee>	<359c5480810010634m377ab993rd030d8c0c917b8b3@mail.gmail.com>	<gc017m$gq4$1@ger.gmane.org>	<48E39BC1.6080200@dls.net>
	<48E3AFB5.5000600@balister.org>
In-Reply-To: <48E3AFB5.5000600@balister.org>
Subject: Re: git master not updating
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Oct 2008 23:38:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Philip Balister wrote:
> The problem is that if someone has a problem and shows up in #oe asking 
> why there are not any updates. If they can't explain the actual command 
> to do the updates, most of the people in #oe cannot help.

The actual git commands executed are printed in the shell where the
makefile is run.  And you can be sure that they haven't just made a typo
 in the git commands, cause it's part of a makefile.

As always, the first thing a user should include in a bug report is a
trace of the execution of the command that is failing.  That will
clearly show the git commands executed.

-- Rod


