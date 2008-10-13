Received: from [66.111.4.28] (helo=out4.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rod@whitby.id.au>) id 1KpE3t-00071t-HY
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Oct 2008 05:25:37 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id 920DF178E8B;
	Sun, 12 Oct 2008 23:20:39 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Sun, 12 Oct 2008 23:20:39 -0400
X-Sasl-enc: m2GqKKXXI2FjCizBEu31B9cnoD5ATNaSZuSi460JRGv1 1223868039
Received: from [192.168.1.11] (secure.astc-design.com [203.122.250.137])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 62323D522;
	Sun, 12 Oct 2008 23:20:38 -0400 (EDT)
Message-ID: <48F2BE7A.2050102@whitby.id.au>
Date: Mon, 13 Oct 2008 13:50:26 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.17 (Windows/20080914)
MIME-Version: 1.0
To: Holger Freyther <zecke@openmoko.org>
References: <200810111447.57212.zecke@selfish.org>
In-Reply-To: <200810111447.57212.zecke@selfish.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Final call for updating the name mapping script
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
X-List-Received-Date: Mon, 13 Oct 2008 03:25:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Holger Freyther wrote:
> However many of the OE and NSLu2 keynames have no proper mapping to any mail 
> address. For OE I have mapped that keyname@unknown.openembedded.org and for 
> nslu2 to keyname@nslu2-linux.org.

All the @nslu2-linux.org ones will work as real addresses.

> There are also some author names without realname or mail address, and some 
> real names without mail address, they got mapped to 
> name.unknown@unknown.openembedded.org.
> 
> Patches welcome. Please send the output as diff -U 0... Otherwise this will be 
> the list of mappings we use for the conversion.

Do you want a patch with *all* the @unknown email addresses I know
(without necessarily contacting those people to find out if they want
that email address listed), or do you want each person to contact you
with their own email address, or do you want me to send you the email
addresses so that you can contact them?

-- Rod


