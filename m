Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1Q5ICO-0003L1-GE
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 15:46:16 +0200
Received: by wye20 with SMTP id 20so2208566wye.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2011 06:44:01 -0700 (PDT)
Received: by 10.227.32.131 with SMTP id c3mr2722592wbd.188.1301579041708;
	Thu, 31 Mar 2011 06:44:01 -0700 (PDT)
Received: from [10.32.10.2] (p57A2133A.dip0.t-ipconnect.de [87.162.19.58])
	by mx.google.com with ESMTPS id ed10sm655807wbb.66.2011.03.31.06.43.59
	(version=SSLv3 cipher=OTHER); Thu, 31 Mar 2011 06:44:00 -0700 (PDT)
Message-ID: <4D94851E.3030308@dresearch-fe.de>
Date: Thu, 31 Mar 2011 15:43:58 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.2.15) Gecko/20110303 Lightning/1.0b2 Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1301382028-10848-1-git-send-email-sledz@dresearch-fe.de>
In-Reply-To: <1301382028-10848-1-git-send-email-sledz@dresearch-fe.de>
Subject: Re: [PATCH] linux-2.6.24: allow building kernel with newer GNU make
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
X-List-Received-Date: Thu, 31 Mar 2011 13:46:21 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8bit

Am 29.03.2011 09:00, schrieb Steffen Sledz:
> GNU make >= 3.82 does not allow mixed implicit and normal rules
> 
> Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>

Somebody willing to ACK?

Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


