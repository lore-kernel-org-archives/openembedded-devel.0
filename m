Received: from mail-pz0-f192.google.com ([209.85.222.192])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vivektambakad@gmail.com>) id 1NFP1o-00086q-8K
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Dec 2009 10:28:15 +0100
Received: by pzk30 with SMTP id 30so3354680pzk.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Dec 2009 01:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=eX+Ow2nlgozo37BO3brrkBFgmBBOgOXv+oiRY4hdb+o=;
	b=uduisjgIjgBt5vAf4ycoeqMOUuLZ/16GPGsWJBxeuI0nvQxSi+PXvKFhjMwayb1hSw
	BxiaFiH61+gMFucTSyde8BbfQkm7a4sInnmNgIJK8HMVSvvqssm3yHhFvLY8ETe4I6UF
	4kS21Z2mTG3r22q3AsTOwzdlSi7/+nqgUxz7U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=uDz+oHxZ2hN0j42+vSELuwoSCcRWQy8czlCPQLJocoVoqGCD3L92InbAxS+HTkuciH
	Ri5nPkjZ/27YI2HzN5R3SZf/YNdx902Xof1wGqI553nWd3eqfAuk/8NHt2qa7KrI5kwt
	WMBiQBcsATfU9tvMaDyzqwf8BhwDTDSt462m0=
MIME-Version: 1.0
Received: by 10.142.1.14 with SMTP id 14mr152396wfa.73.1259659597057; Tue, 01 
	Dec 2009 01:26:37 -0800 (PST)
Date: Tue, 1 Dec 2009 14:56:37 +0530
Message-ID: <ad82c8890912010126u374499a4jdbd39414b67558fb@mail.gmail.com>
From: vivek tambakad <vivektambakad@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.222.192
X-SA-Exim-Mail-From: vivektambakad@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Error while running bibake
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
X-List-Received-Date: Tue, 01 Dec 2009 09:28:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

hi
I want cross compile linphone for compulab EM-x270 board.when i try
   sudo bitbake -b
/home/development/em-x270/stuff/openembedded/recipes/linphone/
linphone_3.1.0.bb
    then i will get the following error
   *bb.parse.ParseError: Could not inherit file classes/autotools.bbclass
*
    pleasse guide me in compiling linphone for compulab board.

   with regards
   vivek tambakad

