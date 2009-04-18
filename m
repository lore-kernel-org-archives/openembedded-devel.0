Received: from [209.85.198.245] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tangx5047@gmail.com>) id 1LvAMn-0008A2-Ky
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Apr 2009 15:13:57 +0200
Received: by rv-out-0708.google.com with SMTP id f25so173614rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Apr 2009 06:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=CSKPRZT2PGtoJODqWZbDl389lNn60sUz4AoAvEEMLWs=;
	b=ucXUb5PdxlQkm2Q/KzqFC4HWdWG4GEivmnCyRWrzn1t/eWCyQpNtqjpbMsDas39Ur5
	BBi4p4WRZA5q/ETSDAFD9o82Mdmoldqm8nGB5H9SoE9R1bbJ/UWKCtxB55bI5u4OqMt1
	rJPbt3PEXWfhELoOjewG7tl8F5eRoM92Y19+4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=doZVy9RTeGfb5PefMHVIsVQqyZFjdOmk6IeeHTESjoCFt8EOs4NrEu8odG3CFQly86
	pRenmU+UYFbF/pVSId0hVCLig4qOynlbkMUknNggJ5wpz/gdchgrzZiU60D9sENeqkmc
	68gH2z4Fi2cNFBqM9HO5sR/iyor/Y5JpNe+00=
MIME-Version: 1.0
Received: by 10.141.20.7 with SMTP id x7mr1649654rvi.14.1240060191322; Sat, 18 
	Apr 2009 06:09:51 -0700 (PDT)
Date: Sat, 18 Apr 2009 21:09:51 +0800
Message-ID: <f7ed13a10904180609re511797nf29ac52a878a6419@mail.gmail.com>
From: Victor Tang <tangx5047@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: recipe "not available"
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
X-List-Received-Date: Sat, 18 Apr 2009 13:13:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

What's bitbake command,bitbake glibc or bitbake -b   *.bb?Try the second.



-- 
Victor Tang

