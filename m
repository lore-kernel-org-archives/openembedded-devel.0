Received: from [74.125.46.154] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M2ard-0000U8-DZ
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 May 2009 02:56:29 +0200
Received: by yw-out-1718.google.com with SMTP id 9so1075458ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 May 2009 17:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to
	:subject:date:message-id:x-mailer;
	bh=h1z6SwH2IqQurzYRMrCQfWe/zmc/p/aSNPj3CfXwAdc=;
	b=Is22xSPwnXbGBhKBSc/qm2LbsQJNH+idPBOg8N0Fa9wg8UrEqkrhsFMsD5xEp5nnq3
	0FLDLjHAUDyI2l0AfpO/I8/GRvh1PFFMFAudL/bZygQq4rRGHPUc/qJ8k6yHibRq0Iob
	Oyq4Ou6vyFIBnhiH4+/iHqVRrC1zX2lLw7E9Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	b=b2x458KxuqBY7tQTIUMUf6093F/ov6yJB2dZ4RzZzXjccEI0nzBDxfYCzPSEF+ChSY
	2+Da0+pE9RLgB/W8oPoyvw5OjvIt9n2W7mdfAG7C9althUGdF9HV3GUEs8HCVUneoOyY
	9i+kNY8RYDLCJsR0LtnxCnoycbTMeCAFek/DA=
Received: by 10.100.6.13 with SMTP id 13mr10064668anf.98.1241830213111;
	Fri, 08 May 2009 17:50:13 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 6sm1653209ywc.21.2009.05.08.17.50.11
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 08 May 2009 17:50:12 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 47399610198; Fri,  8 May 2009 21:50:52 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 May 2009 21:50:16 -0300
Message-Id: <1241830239-5594-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.6.3.rc1.51.gea0b7
Subject: [RFC] Ready to commit patches from O.S. Systems
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
X-List-Received-Date: Sat, 09 May 2009 00:56:29 -0000

Hello,

We'd like to push those patches into dev tree and want some review on
them. I'd also would like to hear advices about:

   [PATCH 11/23] cups: split backends and models

Cheers,




