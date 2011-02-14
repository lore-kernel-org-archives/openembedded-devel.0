Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cdhmanning@gmail.com>) id 1Pp6kP-0008Jr-Ka
	for Openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 23:18:21 +0100
Received: by fxm17 with SMTP id 17so5404551fxm.6
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 14 Feb 2011 14:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type; bh=cnbrr4SSGDeoCnfM7eEmllsoUdrLV9iIKQC7Y8wZbtI=;
	b=IBMl7Lc0rA+VGRNpL09hOFbKz+QwyDvAtAJutVS1lJx6jChW3xyr4BISJGeuuF4W4W
	GKMqFgf4dXpLNquTN6Iy3tfSIuQZ52BSJqGMEu8zf22exGs+qJx6hxI1zJJPq0pq9S+v
	NN8v39PwqheJZ2F4/okYKrwVesfSUM40pBHGM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=qDEUrBVQgRNdm/31uoDHSdMNfwoWJa1rgjht3kVyWTQ2Jr5QgZxbc6Vu2K84B3y593
	izFAg73adFRVz3YYZGBXx4siO2Iyhnuw0X+Cqx+Pur4yo/Y789rFbusGFpeQZx8Vjb+a
	mdUizibHkoq55Bfif8DCru5FdllcHPzil+pwY=
MIME-Version: 1.0
Received: by 10.223.71.197 with SMTP id i5mr5283390faj.127.1297721831667; Mon,
	14 Feb 2011 14:17:11 -0800 (PST)
Received: by 10.223.93.205 with HTTP; Mon, 14 Feb 2011 14:17:11 -0800 (PST)
Date: Tue, 15 Feb 2011 11:17:11 +1300
Message-ID: <AANLkTikLpJU9q7woyJrpTVWaAXK_m557J1uXAF-HLBCs@mail.gmail.com>
From: Charles Manning <cdhmanning@gmail.com>
To: Openembedded-devel@lists.openembedded.org
Subject: Which recipe to get EFL into SDK
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
X-List-Received-Date: Mon, 14 Feb 2011 22:18:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello

I am building an SDK and have managed to get everything added to it
that I want except for EFL.

Any hints as to what recipe to use to add EFL to the SDK?

Thanks

Charles


