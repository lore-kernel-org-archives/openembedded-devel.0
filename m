Received: from ey-out-1920.google.com ([74.125.78.149])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tasskjapp@gmail.com>) id 1O9JKj-0000nG-9O
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 May 2010 16:42:52 +0200
Received: by ey-out-1920.google.com with SMTP id 26so187010eyw.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 May 2010 07:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type;
	bh=ixtSKGsJbsCYT8GU1uyNtEjwN3CNxlIg3e9ZryEtfOI=;
	b=BvOKfqQGyCg6ZUHJHVT2jeYZG2m7xwEB+HSDneTaRngclKa2WUBypnPSEibR9yqH1M
	nc0gUIyfh+kpoi1QcWaypHyx8ZpnnGaT5R/g+WNx708vX7LT5Ab0qeDXduQaLXFrXaBX
	BHKNpDoEBYRhwZZq07k7FggKhtMD4QYlnUkNM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type;
	b=F3z1R+5uS7QkjsxowbjYNwmX5FM2ChlImv8r/W85gMlxFw4HmthoWBsf4hVXGsyt5k
	N/WC2uQ6hstpl/vxNMeXgN+vURaCpt/AE+bz1nrxayYvnO/cfjsUjUlbXw6CKpK97LBk
	IXLm5x6vbFddmqmm1ODbFR0b31II607DyQHfc=
Received: by 10.213.51.212 with SMTP id e20mr6446620ebg.85.1272983944089;
	Tue, 04 May 2010 07:39:04 -0700 (PDT)
Received: from [192.168.0.49] (147.84-49-231.nextgentel.com [84.49.231.147])
	by mx.google.com with ESMTPS id 14sm3797541ewy.14.2010.05.04.07.39.02
	(version=SSLv3 cipher=RC4-MD5); Tue, 04 May 2010 07:39:03 -0700 (PDT)
Message-ID: <4BE031F4.2070706@gmail.com>
Date: Tue, 04 May 2010 16:40:52 +0200
From: Tasslehoff Kjappfot <tasskjapp@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.9pre) Gecko/20100217 Shredder/3.0.3pre
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.78.149
X-SA-Exim-Mail-From: tasskjapp@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: python-pyqt compile error with latest org.openembedded.dev
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
X-List-Received-Date: Tue, 04 May 2010 14:42:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

My compile fails with this output:

http://pastebin.org/201169

- Tasslehoff

