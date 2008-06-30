Received: from [74.125.46.154] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <e.robertson.svg@gmail.com>) id 1KDLV9-0003PX-6D
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Jun 2008 17:41:11 +0200
Received: by yw-out-1718.google.com with SMTP id 5so978075ywr.42
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jun 2008 08:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:mime-version:content-type:content-transfer-encoding
	:content-disposition:message-id;
	bh=hPZVZpHEZmNuT9WPOZ83msOMhvLctSx333kufmTFek8=;
	b=aSL+7aqmzUW7S9LWk9vF64uGbjncDyHg7AlH0N4IH38p+JPaj/5OxwFrzfHAxY3Ten
	QlkFVClZTaTGL4sF4KZfcXcl7s5h975mf4gthmLCOopzTcRicQQSUDsoHlAaIdlBDAD3
	3QhUSHVHL5zI7NkZqURuFOo07sK4/Lzm1qcRg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:mime-version:content-type
	:content-transfer-encoding:content-disposition:message-id;
	b=X9noniz5PRw68fosXai4uRc+uLwUUGEq8b1eiroS28YH/QvKuS4m0tjMb0XS7wtoSG
	W/5a0+fpzB0cOG4C9mJmCo+ilIFWS1GFzyTdNU86KJ+em/egebVKEe5I3HmP+KM+RNzt
	xvBmIowMcveoxatyF7zIm1YhAfHqxIhLykWb0=
Received: by 10.114.169.2 with SMTP id r2mr4259076wae.132.1214840295028;
	Mon, 30 Jun 2008 08:38:15 -0700 (PDT)
Received: from vincy ( [74.254.162.162])
	by mx.google.com with ESMTPS id 7sm6824974ywo.7.2008.06.30.08.38.14
	(version=SSLv3 cipher=RC4-MD5); Mon, 30 Jun 2008 08:38:14 -0700 (PDT)
From: E Robertson <e.robertson.svg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Jun 2008 10:37:44 -0500
User-Agent: KMail/1.9.9
MIME-Version: 1.0
Message-Id: <200806301037.44918.e.robertson.svg@gmail.com>
Subject: Global defines
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Mon, 30 Jun 2008 15:41:11 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

HI All,
I'm trying to add a header file to the staging area and define some global 
variables so that this header file can be use accordingly.
Is it possible to define these global defines in a conf file so that they can 
act an env variables? How can I do this or is their an example of this?
What conf file can be used for this?
My intention is to use a package bb file to do_stage adding the custom header 
files, then add the defines to a conf file, maybe the distro conf?

Thanks.


