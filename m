Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <holger+oe@freyther.de>) id 1PhUEN-0005KX-SC
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Jan 2011 22:45:47 +0100
Received: from [192.168.0.101] (91-64-83-241-dynip.superkabel.de
	[91.64.83.241])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id 88FB81B10C05
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jan 2011 21:53:58 +0000 (UTC)
Message-ID: <4D3DF2DC.2020107@freyther.de>
Date: Mon, 24 Jan 2011 22:45:00 +0100
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1295900293-25470-1-git-send-email-raj.khem@gmail.com>
	<1295900293-25470-4-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1295900293-25470-4-git-send-email-raj.khem@gmail.com>
Subject: Re: [PATCH 3/5] recipes/meta recipes/tasks: Replace ipkg-utils with opkg-utils
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
X-List-Received-Date: Mon, 24 Jan 2011 21:45:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 01/24/2011 09:18 PM, Khem Raj wrote:
> -DEPENDS = "opkg-native ipkg-utils-native fakeroot-native sed-native zip-native"
> +DEPENDS = "opkg-native opkg-utils-native fakeroot-native sed-native zip-native"
>  PR = "r5"

Do you want to change the PR?


