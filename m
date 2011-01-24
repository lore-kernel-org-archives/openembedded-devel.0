Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <holger+oe@freyther.de>) id 1PhUzE-0006oS-8N
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Jan 2011 23:34:12 +0100
Received: from [192.168.0.101] (91-64-83-241-dynip.superkabel.de
	[91.64.83.241])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id 0044D1B10C0C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jan 2011 22:42:22 +0000 (UTC)
Message-ID: <4D3DFE34.3090706@freyther.de>
Date: Mon, 24 Jan 2011 23:33:24 +0100
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D3DE56B.7020803@freyther.de> <4D3DF7CF.7010308@freyther.de>
In-Reply-To: <4D3DF7CF.7010308@freyther.de>
Subject: Re: build errors in openssl-native
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
X-List-Received-Date: Mon, 24 Jan 2011 22:34:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 01/24/2011 11:06 PM, Holger Freyther wrote:
> On 01/24/2011 09:47 PM, Holger Freyther wrote:
>> Hi,
>>
>> is anyone else seeing build errors like this:

next weird breakage is curl-native... compiled without gnutls ending up
linking to the system gnutls that uses gcrypt but does not link to it...


