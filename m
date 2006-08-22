Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <rpurdie@rpsys.net>) id 1GFa7A-0006zj-LT
	for openembedded-devel@openembedded.org; Tue, 22 Aug 2006 19:32:36 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.6) with ESMTP id k7MHURZM030571;
	Tue, 22 Aug 2006 18:30:27 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28078-05-2; Tue, 22 Aug 2006 18:30:22 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.6) with ESMTP id k7MHUHpo030321
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Tue, 22 Aug 2006 18:30:17 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: oe@handhelds.org, openembedded-devel@openembedded.org
In-Reply-To: <E1GEBoO-0004rL-CK@linuxtogo.org>
References: <E1GEBoO-0004rL-CK@linuxtogo.org>
Date: Tue, 22 Aug 2006 18:30:17 +0100
Message-Id: <1156267818.5920.21.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [Oe-commits] org.oe.dev swig-native: add a bb file for 1.3.29.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: <openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Aug 2006 17:32:37 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2006-08-18 at 23:23 +0200, mreimer commit wrote:
> swig-native: add a bb file for 1.3.29.
> 
> Author: mreimer@openembedded.org

> ============================================================
> --- packages/swig/swig-native_1.3.29.bb	89569bd5aec701a45a7c326cb76e3cc22761dd61
> +++ packages/swig/swig-native_1.3.29.bb	89569bd5aec701a45a7c326cb76e3cc22761dd61
> @@ -0,0 +1,7 @@
> +require swig_${PV}.bb

Could you add swig_1.3.29.bb please? :)

Richard




