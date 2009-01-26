Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1LRW8L-0001fL-KX
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Jan 2009 19:24:29 +0100
Received: from andromeda.vanille.de (e180153012.adsl.alicedsl.de
	[85.180.153.12])
	by drlauer-research.com (Postfix) with ESMTP id 7C685584152
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jan 2009 19:38:35 +0100 (CET)
From: "Michael 'Mickey' Lauer" <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Jan 2009 19:16:58 +0100
User-Agent: KMail/1.9.10
References: <8763k3czl7.fsf@news.piechotka.com.pl>
	<200901251759.43567.mickey@vanille-media.de>
	<871vuqcqz9.fsf@news.piechotka.com.pl>
In-Reply-To: <871vuqcqz9.fsf@news.piechotka.com.pl>
MIME-Version: 1.0
Message-Id: <200901261916.58938.mickey@vanille-media.de>
Subject: Re: Problem with building connman
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
X-List-Received-Date: Mon, 26 Jan 2009 18:24:29 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Am Monday 26 January 2009 11:16:10 schrieb Maciej Piechotka:
> "Michael 'Mickey' Lauer" <mickey@vanille-media.de> writes:
> > Which libtool version?
>
> libtool-cross-1.5.10-r10
> libtool-native-1.5.10-r10

Can you retry with libtool2 and automake 1.10?

-- 
:M:


