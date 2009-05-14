Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1M4hq0-0001aE-13
	for openembedded-devel@openembedded.org; Thu, 14 May 2009 22:47:32 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1M4hjM-0007LR-5p
	for openembedded-devel@openembedded.org; Thu, 14 May 2009 20:40:40 +0000
Received: from 92-100-169-200.dynamic.avangarddsl.ru ([92.100.169.200])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 14 May 2009 20:40:40 +0000
Received: from dbaryshkov by 92-100-169-200.dynamic.avangarddsl.ru with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 14 May 2009 20:40:40 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date: Thu, 14 May 2009 20:40:30 +0000 (UTC)
Message-ID: <guhvju$ibq$1@ger.gmane.org>
References: <20090514144631.E363E1893D6@amethyst.openembedded.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: 92-100-169-200.dynamic.avangarddsl.ru
User-Agent: Pan/0.132 (Waxed in Black)
Sender: news <news@ger.gmane.org>
Subject: Re: Sergey Lapin : AFEB9260 is not supported with	2.6.28-rc6 kernel anymore
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
X-List-Received-Date: Thu, 14 May 2009 20:47:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

GIT User account wrote:

> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: 215a464bbd090a3e9c6344f78fd36c8074ce5537 URL:   
> http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=215a464bbd090a3e9c6344f78fd36c8074ce5537
> 
> Author: Sergey Lapin <slapin@ossfans.org>
> Date:   Thu May 14 17:12:34 2009 +0400
> 
> AFEB9260 is not supported with 2.6.28-rc6 kernel anymore
> 

Is it really "not supported" or you just prefer another kernel version?
In the second case you can simply change DEFAULT_PREFERENCE_afeb9260 to "-1".

And BTW: as you seem to be the only user of this image, it seems you can just
drop this rc kernel recipe completely.

-- 
With best wishes
Dmitry




