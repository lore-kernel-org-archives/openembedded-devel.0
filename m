Received: from [202.165.105.131] (helo=web15201.mail.cnb.yahoo.com)
	by linuxtogo.org with smtp (Exim 4.63)
	(envelope-from <wzc0066@yahoo.com.cn>) id 1HCDCY-0001v4-Qp
	for openembedded-devel@openembedded.org; Wed, 31 Jan 2007 12:00:33 +0100
Received: (qmail 15886 invoked by uid 60001); 31 Jan 2007 10:47:52 -0000
X-YMail-OSG: R_wxnQkVM1mo9NZsmeaB2JDZEceYnERlprXYz3isrbfSvv_qa24VNjuC1v_dDOW_q6HDpkYeFBSnUNyRyXwlhIn8qpM725F7nDHyjucR6h8qTE9BFmh65LdI1k9BSCRJyEaTbLcRYhrk9ZMOFd.yT55Kj6ZqjQ8HJOs-
Received: from [221.221.147.139] by web15201.mail.cnb.yahoo.com via HTTP;
	Wed, 31 Jan 2007 18:47:52 CST
Date: Wed, 31 Jan 2007 18:47:52 +0800 (CST)
From: zechao wang <wzc0066@yahoo.com.cn>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <45C04A4A.3070207@dominion.kabel.utwente.nl>
MIME-Version: 1.0
Message-ID: <413134.14299.qm@web15201.mail.cnb.yahoo.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Not a question !
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 31 Jan 2007 11:00:39 -0000
Content-Type: text/plain; charset=gb2312
Content-Transfer-Encoding: 8bit

Hello everyone:

I'm sorry i have bothered all of you. I have asked too many questions, and most of them were replied. Thanks so much.

I have thought the poky is very similar with the oe, so a lot of questions were  posted here. But now i realized that they are very different. Thanks Koen Kooi, you made me know it. 

Don't sneer me, i think everyone of you have grown up from a newbie to an old hand, right ?

Ok, i have known that if i have trouble with poky, i would ask o-hand for help, and if my trouble is caused by oe, i would come here.

regards
 


 		
---------------------------------
 Mp3疯狂搜-新歌热歌高速下   
From rpurdie@rpsys.net Wed Jan 31 12:01:47 2007
Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HCDDh-0001wS-4U
	for openembedded-devel@openembedded.org; Wed, 31 Jan 2007 12:01:45 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l0VB1b1O000806;
	Wed, 31 Jan 2007 11:01:37 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00471-07; Wed, 31 Jan 2007 11:01:35 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l0VB1XRk000799
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Wed, 31 Jan 2007 11:01:33 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org, zechao wang <wzc0066@yahoo.com.cn>
In-Reply-To: <45C0545B.3080202@dominion.kabel.utwente.nl>
References: <467450.36829.qm@web15206.mail.cnb.yahoo.com>
	<45C0545B.3080202@dominion.kabel.utwente.nl>
Content-Type: text/plain
Date: Wed, 31 Jan 2007 11:01:33 +0000
Message-Id: <1170241293.5809.23.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [oe] Trouble with building "libbonoboui" ?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 31 Jan 2007 11:01:47 -0000

On Wed, 2007-01-31 at 09:33 +0100, Koen Kooi wrote:
> 4) For poky support, you need to contact o-hand
> 
> To summarize: Use .dev or stop bothering us and contact o-hand.

Its safe to say that o-hand will tell you to use .dev. We have no
intention of supporting bonobo in Poky. As Koen says, we've actually
gone to great lengths to remove certain things like that. 

If a client requested it, that would be different but we don't have any
such clients.

Regards,

Richard
(Openedhand Employee + Poky Maintainer)



