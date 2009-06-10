Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MEQ2f-0001Jd-Nl
	for openembedded-devel@openembedded.org; Wed, 10 Jun 2009 17:48:45 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MEPtF-0001uo-1K
	for openembedded-devel@openembedded.org; Wed, 10 Jun 2009 15:39:01 +0000
Received: from p3077-ipngn201marunouchi.tokyo.ocn.ne.jp ([114.177.118.77])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 10 Jun 2009 15:39:01 +0000
Received: from no2spam by p3077-ipngn201marunouchi.tokyo.ocn.ne.jp with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 10 Jun 2009 15:39:01 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Thu, 11 Jun 2009 00:38:44 +0900
Message-ID: <h0ok27$3ue$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: p3077-ipngn201marunouchi.tokyo.ocn.ne.jp
User-Agent: Thunderbird 2.0.0.21 (X11/20090409)
Sender: news <news@ger.gmane.org>
Subject: fortran problem on hardy build machine (gcc-cross fails do_compile)
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
X-List-Received-Date: Wed, 10 Jun 2009 15:48:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I've been struggling with gcc-cross failing do_compile on my hardy build
machine for about half a year now.  It has something to do with fortran.
I have installed every fortran package I could find in aptitude, yet
the issue is unresolved.  I'd appreciate if you'd take a look at the
compile log in http://oss.leggewie.org/oe/gcc-cross-4.3.3-r4.1/temp/ and
let me know if you have any suggestion.

Regards

Rolf



