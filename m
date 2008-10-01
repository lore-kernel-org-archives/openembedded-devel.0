Received: from [66.111.4.27] (helo=out3.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rod@whitby.id.au>) id 1KlBdK-0002hf-EJ
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Oct 2008 02:01:35 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id 4E4991722C6
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Oct 2008 19:57:20 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Wed, 01 Oct 2008 19:57:20 -0400
X-Sasl-enc: 3+inQU8BJWGCJlHWc7ySh182XkdE5HV4ZwaJT/pxi99U 1222905439
Received: from [192.168.1.11] (secure.astc-design.com [203.122.250.137])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 60A53A9CB
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Oct 2008 19:57:19 -0400 (EDT)
Message-ID: <48E40E58.6020702@whitby.id.au>
Date: Thu, 02 Oct 2008 09:27:12 +0930
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.16 (Windows/20080708)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <48E36C18.4090504@smartlink.ee>	<873ajglc0d.fsf@neumann.lab.ossystems.com.br>	<48E3762E.6000203@smartlink.ee>	<359c5480810010634m377ab993rd030d8c0c917b8b3@mail.gmail.com>	<gc017m$gq4$1@ger.gmane.org>
	<48E39BC1.6080200@dls.net>	<gc0bc5$o9o$2@ger.gmane.org>	<20081001184353.GD3010@smtp.west.cox.net>	<gc0lv9$46r$1@ger.gmane.org>
	<20081001213635.GF3010@smtp.west.cox.net>
In-Reply-To: <20081001213635.GF3010@smtp.west.cox.net>
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
X-List-Received-Date: Thu, 02 Oct 2008 00:01:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

For those people who are using the FSO Makefile, it has now been updated
 to match the new unofficial undocumented instructions on how to use the
trial OE git repo.

"make update-makefile" followed by "make setup-openembedded" will
automatically migrate your build environment to use the
org.openembedded.dev branch.

[Now let's see how quickly all the other places on the internet where
the old instructions live are updated, and how many more bug reports and
questions we get from people following them and not having a means to
automatically migrate to the new way of doing things.]

-- Rod


