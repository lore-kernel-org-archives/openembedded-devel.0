Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Mahrn-0006C4-8j
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Aug 2009 05:17:39 +0200
Received: from tamarin.localnet (123-192-185-227.dynamic.kbronet.com.tw
	[123.192.185.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 1F2171B10C0C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Aug 2009 03:04:30 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Aug 2009 05:00:45 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.0; i686; ; )
References: <1248042838-7496-1-git-send-email-otavio@ossystems.com.br>
	<1248042838-7496-2-git-send-email-otavio@ossystems.com.br>
	<1248042838-7496-3-git-send-email-otavio@ossystems.com.br>
In-Reply-To: <1248042838-7496-3-git-send-email-otavio@ossystems.com.br>
MIME-Version: 1.0
Message-Id: <200908110500.45961.holger+oe@freyther.de>
Subject: Re: [PATCH 3/3] Avoids overwriting Python's built-in `str' in get_devtable_list
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
X-List-Received-Date: Tue, 11 Aug 2009 03:17:39 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday 20 July 2009 00:33:58 Otavio Salvador wrote:
> From: Mario Domenech Goulart <mario@ossystems.com.br>

Cool, when was this list generation introduced to python? Does it have an 
impact on our minimum python version?



