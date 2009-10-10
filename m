Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Mwdw4-0008Gw-F7
	for openembedded-devel@lists.openembedded.org;
	Sat, 10 Oct 2009 17:32:47 +0200
Received: from tamarin.localnet (123-192-145-111.dynamic.kbronet.com.tw
	[123.192.145.111])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 272C21B10C04
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Oct 2009 15:40:01 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 10 Oct 2009 17:31:42 +0200
User-Agent: KMail/1.12.2 (Linux/2.6.32-rc3-00337-gbd38193; KDE/4.3.2; i686; ; )
References: <200910100322.07608.david.lanzendoerfer@o2s.ch>
	<EC39BD99FF22424187B9D113F67FF56634883DD72F@octopus.DViCO.local>
	<EC39BD99FF22424187B9D113F67FF56634883DD733@octopus.DViCO.local>
In-Reply-To: <EC39BD99FF22424187B9D113F67FF56634883DD733@octopus.DViCO.local>
MIME-Version: 1.0
Message-Id: <200910101731.42654.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: =?UTF-8?B?UmU6IOetlOWkjTogUmU6IGxpYnhtbDItbmF0aXZlIGJ1aWxkIGlzc3Vl?=
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
X-List-Received-Date: Sat, 10 Oct 2009 15:32:47 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit

On Saturday 10 October 2009 08:37:06 Leo Liang wrote:
> ok, answer my own question, after I change class/insane.bbclass
> from
> def package_qa_get_machine_dict():
>     return {
>             "linux-gnu" : {
> 
> to
> 
> def package_qa_get_machine_dict():
>     return {
>             "linux" : {
> 
> everything goes well.

It doesn't this is why Khem is rolling out changes. Please see the top posts 
Graeme and Khem..

z.


